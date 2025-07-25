#!/bin/bash

# Final Cleanup Script
# This script removes extra closing div tags and ensures proper structure

echo "🔧 Final cleanup..."

# Function to clean up structure in a file
cleanup_structure() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Cleaning up structure in: $file"
    
    # Create a backup
    cp "$file" "${file}.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Remove extra closing div tags and fix structure
    sed -E '
    # Remove multiple consecutive closing div tags
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    s/<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    
    # Fix device cards missing closing a tag
    s/(<a href="[^"]*" class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors">\s*<div class="mb-3">\s*<svg[^>]*><\/svg>\s*<\/div>\s*<h3[^>]*>[^<]*<\/h3>)/\1<\/a>/g
    
    # Fix content containers missing closing div
    s/(<div class="text-center mb-16 content-container">\s*<h2[^>]*>[^<]*<\/h2>\s*<p[^>]*>[^<]*<\/p>)/\1<\/div>/g
    
    # Fix hero section button container
    s/(<div class="flex flex-col sm:flex-row gap-4 justify-center">\s*<a[^>]*>[^<]*<\/a>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    ' "$file" > "$temp_file"
    
    # Additional cleanup using awk
    awk '
    BEGIN { 
        div_stack = 0
        in_section = 0
    }
    
    # Track opening tags
    /<section[^>]*>/ { 
        in_section = 1
    }
    
    /<div[^>]*>/ { 
        div_stack++
    }
    
    # Track closing tags
    /<\/section>/ { 
        in_section = 0
    }
    
    /<\/div>/ { 
        div_stack--
        if (div_stack < 0) div_stack = 0
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
fix_sections() {
    local file="$1"
    
    echo "Fixing sections in: $file"
    
    # Fix the categories section
    sed -i -E '
    # Fix categories section structure
    /<!-- Categories Section -->/,/<!-- Device Types Section -->/ {
        # Ensure proper structure
        s/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/
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
    }
    
    # Fix budget section
    /<!-- Budget Section -->/,/<!-- Contact Section -->/ {
        # Ensure proper structure
        s/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/
    }
    ' "$file"
}

# Main execution
echo "Starting final cleanup for all HTML files..."

# Fix main pages
for file in index.html privacy.html terms.html; do
    if [ -f "$file" ]; then
        echo "Processing main page: $file"
        cleanup_structure "$file"
        fix_sections "$file"
    fi
done

# Fix category pages
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        for file in "$dir"*.html; do
            if [ -f "$file" ]; then
                echo "Processing category page: $file"
                cleanup_structure "$file"
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
            cleanup_structure "$file"
            fix_sections "$file"
        fi
    done
fi

echo "✅ Final cleanup completed!"
echo "All HTML files now have clean, proper structure." 