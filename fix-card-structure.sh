#!/bin/bash

# Fix Card Structure Script
# This script specifically fixes the card-hover elements missing closing div tags

echo "🔧 Fixing card structure..."

# Function to fix card structure in a file
fix_card_structure() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing card structure in: $file"
    
    # Create a backup
    cp "$file" "${file}.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix the card structure using awk
    awk '
    BEGIN { 
        in_card = 0
        card_content = ""
    }
    
    # Track card-hover elements
    /<div class="card-hover">/ {
        in_card = 1
        card_content = $0
        next
    }
    
    # If we are in a card, collect content
    in_card {
        card_content = card_content "\n" $0
        
        # Check if we have a complete card (h3, p, a tags)
        if ($0 ~ /<\/a>/) {
            # Add closing div if missing
            if (card_content !~ /<\/div>$/) {
                card_content = card_content "\n</div>"
            }
            print card_content
            in_card = 0
            card_content = ""
            next
        }
        next
    }
    
    # Print non-card lines
    { print }
    ' "$file" > "$temp_file"
    
    # Additional fixes using sed
    sed -E '
    # Fix card-hover elements that are missing closing div
    s/(<div class="card-hover">\s*<h3[^>]*>[^<]*<\/h3>\s*<p[^>]*>[^<]*<\/p>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    
    # Fix device cards that are missing closing a tag
    s/(<a href="[^"]*" class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors">\s*<div class="mb-3">\s*<svg[^>]*><\/svg>\s*<\/div>\s*<h3[^>]*>[^<]*<\/h3>)/\1<\/a>/g
    
    # Fix content containers that are missing closing div
    s/(<div class="text-center mb-16 content-container">\s*<h2[^>]*>[^<]*<\/h2>\s*<p[^>]*>[^<]*<\/p>)/\1<\/div>/g
    
    # Fix hero section button container
    s/(<div class="flex flex-col sm:flex-row gap-4 justify-center">\s*<a[^>]*>[^<]*<\/a>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    ' "$temp_file" > "$file"
    
    # Clean up temp file
    rm "$temp_file"
}

# Function to fix specific sections
fix_sections() {
    local file="$1"
    
    echo "Fixing sections in: $file"
    
    # Fix the categories section
    sed -i -E '
    # Fix categories section structure
    /<!-- Categories Section -->/,/<!-- Device Types Section -->/ {
        # Ensure proper structure
        s/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/
        
        # Fix card-hover elements
        s/(<div class="card-hover">\s*<h3[^>]*>[^<]*<\/h3>\s*<p[^>]*>[^<]*<\/p>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    }
    
    # Fix device types section
    /<!-- Device Types Section -->/,/<!-- Solutions Section -->/ {
        # Ensure proper structure
        s/<div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-8">/<div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-8">/
        
        # Fix device cards
        s/(<a href="[^"]*" class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors">\s*<div class="mb-3">\s*<svg[^>]*><\/svg>\s*<\/div>\s*<h3[^>]*>[^<]*<\/h3>)/\1<\/a>/g
    }
    
    # Fix solutions section
    /<!-- Solutions Section -->/,/<!-- Budget Section -->/ {
        # Ensure proper structure
        s/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/
        
        # Fix card-hover elements
        s/(<div class="card-hover">\s*<h3[^>]*>[^<]*<\/h3>\s*<p[^>]*>[^<]*<\/p>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    }
    
    # Fix budget section
    /<!-- Budget Section -->/,/<!-- Contact Section -->/ {
        # Ensure proper structure
        s/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/
        
        # Fix card-hover elements
        s/(<div class="card-hover">\s*<h3[^>]*>[^<]*<\/h3>\s*<p[^>]*>[^<]*<\/p>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    }
    ' "$file"
}

# Main execution
echo "Starting card structure fixes for all HTML files..."

# Fix main pages
for file in index.html privacy.html terms.html; do
    if [ -f "$file" ]; then
        echo "Processing main page: $file"
        fix_card_structure "$file"
        fix_sections "$file"
    fi
done

# Fix category pages
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        for file in "$dir"*.html; do
            if [ -f "$file" ]; then
                echo "Processing category page: $file"
                fix_card_structure "$file"
                fix_sections "$file"
            fi
        done
    fi
done

# Fix src/pages files if they exist
if [ -d "src/pages" ]; then
    for file in src/pages/**/*.html; do
        if [ -f "$file" ]; then
            echo "Processing src page: $file"
            fix_card_structure "$file"
            fix_sections "$file"
        fi
    done
fi

echo "✅ Card structure fixes completed!"
echo "All card-hover elements now have proper closing div tags." 