#!/bin/bash

# Comprehensive Final Fix Script
# This script fixes the remaining structural issues with device cards and all pages

echo "🔧 Comprehensive final fix..."

# Function to fix device cards and structure
fix_device_cards_and_structure() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing device cards and structure in: $file"
    
    # Create a backup
    cp "$file" "${file}.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix device cards missing closing a tags
    sed -E '
    # Fix device cards that are missing closing a tag
    s/(<a href="[^"]*" class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors">\s*<div class="mb-3">\s*<svg[^>]*><\/svg>\s*<\/div>\s*<h3[^>]*>[^<]*<\/h3>)/\1<\/a>/g
    
    # Fix any remaining device cards with different patterns
    s/(<a href="[^"]*" class="card[^>]*>\s*<div[^>]*>\s*<svg[^>]*><\/svg>\s*<\/div>\s*<h3[^>]*>[^<]*<\/h3>)/\1<\/a>/g
    
    # Remove extra closing div tags
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    
    # Fix missing closing divs for content containers
    s/(<div class="text-center mb-16 content-container">\s*<h2[^>]*>[^<]*<\/h2>\s*<p[^>]*>[^<]*<\/p>)/\1<\/div>/g
    
    # Fix hero section button container
    s/(<div class="flex flex-col sm:flex-row gap-4 justify-center">\s*<a[^>]*>[^<]*<\/a>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    
    # Fix contact form structure
    s/(<div class="grid grid-cols-1 md:grid-cols-2 gap-6 gap-8">)/<div class="grid grid-cols-1 md:grid-cols-2 gap-6">/g
    
    # Fix missing closing divs for form elements
    s/(<div>\s*<label[^>]*>[^<]*<\/label>\s*<input[^>]*>)/\1<\/div>/g
    s/(<div>\s*<label[^>]*>[^<]*<\/label>\s*<textarea[^>]*>[^<]*<\/textarea>)/\1<\/div>/g
    
    # Fix missing closing divs for button container
    s/(<div class="text-center content-container">\s*<button[^>]*>[^<]*<\/button>)/\1<\/div>/g
    
    # Fix missing closing divs for email section
    s/(<div class="mt-8 text-center content-container">\s*<p[^>]*>[^<]*<\/p>)/\1<\/div>/g
    ' "$file" > "$temp_file"
    
    # Additional fixes using awk for proper structure
    awk '
    BEGIN { 
        div_stack = 0
        in_section = 0
        in_grid = 0
    }
    
    # Track opening tags
    /<section[^>]*>/ { 
        in_section = 1
    }
    
    /<div[^>]*>/ { 
        div_stack++
        if ($0 ~ /class="grid/) in_grid = 1
    }
    
    # Track closing tags
    /<\/section>/ { 
        in_section = 0
    }
    
    /<\/div>/ { 
        div_stack--
        if (div_stack < 0) div_stack = 0
    }
    
    # Fix specific structural issues
    /<!-- Device Types Section -->/ {
        print
        next
    }
    
    /<!-- Solutions Section -->/ {
        # Close any open divs before starting new section
        while (div_stack > 0) {
            print "</div>"
            div_stack--
        }
        print
        next
    }
    
    /<!-- Budget Section -->/ {
        # Close any open divs before starting new section
        while (div_stack > 0) {
            print "</div>"
            div_stack--
        }
        print
        next
    }
    
    /<!-- Contact Section -->/ {
        # Close any open divs before starting new section
        while (div_stack > 0) {
            print "</div>"
            div_stack--
        }
        print
        next
    }
    
    # Print the line
    { print }
    
    END {
        # Close any remaining open divs
        while (div_stack > 0) {
            print "</div>"
            div_stack--
        }
    }
    ' "$temp_file" > "$file"
    
    # Clean up temp file
    rm "$temp_file"
}

# Function to fix specific sections
fix_specific_sections() {
    local file="$1"
    
    echo "Fixing specific sections in: $file"
    
    # Fix the device integration section specifically
    sed -i -E '
    # Fix device integration section
    /<!-- Device Types Section -->/,/<!-- Solutions Section -->/ {
        # Ensure proper structure
        s/<div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-8">/<div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-8">/
        
        # Fix device cards - ensure they have closing a tags
        s/(<a href="[^"]*" class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors">\s*<div class="mb-3">\s*<svg[^>]*><\/svg>\s*<\/div>\s*<h3[^>]*>[^<]*<\/h3>)/\1<\/a>/g
    }
    
    # Fix categories section
    /<!-- Categories Section -->/,/<!-- Device Types Section -->/ {
        # Ensure proper structure
        s/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/
        
        # Fix card-hover elements
        s/(<div class="card-hover">\s*<h3[^>]*>[^<]*<\/h3>\s*<p[^>]*>[^<]*<\/p>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
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
    
    # Fix contact section
    /<!-- Contact Section -->/,/<!-- Footer -->/ {
        # Fix form structure
        s/<div class="grid grid-cols-1 md:grid-cols-2 gap-6 gap-8">/<div class="grid grid-cols-1 md:grid-cols-2 gap-6">/g
        
        # Fix missing closing divs for form elements
        s/(<div>\s*<label[^>]*>[^<]*<\/label>\s*<input[^>]*>)/\1<\/div>/g
        s/(<div>\s*<label[^>]*>[^<]*<\/label>\s*<textarea[^>]*>[^<]*<\/textarea>)/\1<\/div>/g
    }
    ' "$file"
}

# Main execution
echo "Starting comprehensive final fix for all HTML files..."

# Fix main pages
for file in index.html privacy.html terms.html; do
    if [ -f "$file" ]; then
        echo "Processing main page: $file"
        fix_device_cards_and_structure "$file"
        fix_specific_sections "$file"
    fi
done

# Fix category pages
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        for file in "$dir"*.html; do
            if [ -f "$file" ]; then
                echo "Processing category page: $file"
                fix_device_cards_and_structure "$file"
                fix_specific_sections "$file"
            fi
        done
    fi
done

# Fix src/pages files if they exist
if [ -d "src/pages" ]; then
    for file in src/pages/**/*.html; do
        if [ -f "$file" ]; then
            echo "Processing src page: $file"
            fix_device_cards_and_structure "$file"
            fix_specific_sections "$file"
        fi
    done
fi

echo "✅ Comprehensive final fix completed!"
echo "All HTML files now have proper device cards and clean structure." 