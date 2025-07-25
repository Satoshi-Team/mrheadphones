#!/bin/bash

# Final Structure Cleanup Script
# This script fixes the remaining structural issues with proper div nesting

echo "🔧 Final structure cleanup..."

# Function to fix structural issues in a file
fix_structure() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing structure in: $file"
    
    # Create a backup
    cp "$file" "${file}.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix the structure using awk for proper div tracking
    awk '
    BEGIN { 
        div_stack = 0
        in_section = 0
        in_grid = 0
        in_card = 0
        section_stack = 0
    }
    
    # Track opening tags
    /<section[^>]*>/ { 
        section_stack++
        in_section = 1
    }
    
    /<div[^>]*>/ { 
        div_stack++
        if ($0 ~ /class="grid/) in_grid = 1
        if ($0 ~ /class="card-hover/) in_card = 1
    }
    
    # Track closing tags
    /<\/section>/ { 
        section_stack--
        if (section_stack < 0) section_stack = 0
        in_section = 0
    }
    
    /<\/div>/ { 
        div_stack--
        if (div_stack < 0) div_stack = 0
    }
    
    # Fix specific structural issues
    /<!-- Categories Section -->/ {
        print
        next
    }
    
    /<!-- Device Types Section -->/ {
        # Close any open divs before starting new section
        while (div_stack > 0) {
            print "</div>"
            div_stack--
        }
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
    ' "$file" > "$temp_file"
    
    # Additional fixes using sed
    sed -E '
    # Fix duplicate closing divs
    s/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g
    
    # Fix missing closing divs for card-hover elements
    s/(<div class="card-hover">\s*<h3[^>]*>[^<]*<\/h3>\s*<p[^>]*>[^<]*<\/p>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    
    # Fix missing closing divs for content containers
    s/(<div class="text-center mb-16 content-container">\s*<h2[^>]*>[^<]*<\/h2>\s*<p[^>]*>[^<]*<\/p>)/\1<\/div>/g
    
    # Fix missing closing divs for grid containers
    s/(<div class="grid[^>]*>\s*<!-- [^>]* -->\s*<div[^>]*>)/\1<\/div>/g
    
    # Fix hero section button container
    s/(<div class="flex flex-col sm:flex-row gap-4 justify-center">\s*<a[^>]*>[^<]*<\/a>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    ' "$temp_file" > "$file"
    
    # Clean up temp file
    rm "$temp_file"
}

# Function to fix specific patterns
fix_specific_patterns() {
    local file="$1"
    
    echo "Fixing specific patterns in: $file"
    
    # Fix the categories section structure
    sed -i -E '
    # Fix categories section
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
echo "Starting final structure cleanup for all HTML files..."

# Fix main pages
for file in index.html privacy.html terms.html; do
    if [ -f "$file" ]; then
        echo "Processing main page: $file"
        fix_structure "$file"
        fix_specific_patterns "$file"
    fi
done

# Fix category pages
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        for file in "$dir"*.html; do
            if [ -f "$file" ]; then
                echo "Processing category page: $file"
                fix_structure "$file"
                fix_specific_patterns "$file"
            fi
        done
    fi
done

# Fix src/pages files if they exist
if [ -d "src/pages" ]; then
    for file in src/pages/**/*.html; do
        if [ -f "$file" ]; then
            echo "Processing src page: $file"
            fix_structure "$file"
            fix_specific_patterns "$file"
        fi
    done
fi

echo "✅ Final structure cleanup completed!"
echo "All HTML files now have proper structure with correct div nesting." 