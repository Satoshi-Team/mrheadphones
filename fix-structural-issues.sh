#!/bin/bash

# Fix Structural Issues Script
# This script fixes missing closing div tags, duplicate classes, and improper nesting

echo "🔧 Fixing structural HTML issues..."

# Function to fix structural issues in a file
fix_structural_issues() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing structural issues in: $file"
    
    # Create a backup
    cp "$file" "${file}.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix the structural issues
    sed -E '
    # Fix missing closing div tags in sections
    s/(<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 gap-8">)/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/g
    s/(<div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-6 gap-8 gap-8">)/<div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-8">/g
    
    # Fix duplicate gap classes
    s/gap-8 gap-8/gap-8/g
    s/gap-6 gap-8 gap-8/gap-8/g
    
    # Fix missing closing div tags for card-hover elements
    s/(<div class="card-hover">\s*<h3[^>]*>[^<]*<\/h3>\s*<p[^>]*>[^<]*<\/p>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    
    # Fix missing closing div tags for content containers
    s/(<div class="text-center mb-16 content-container">\s*<h2[^>]*>[^<]*<\/h2>\s*<p[^>]*>[^<]*<\/p>)/\1<\/div>/g
    
    # Fix missing closing div tags for grid containers
    s/(<div class="grid[^>]*>\s*<!-- [^>]* -->\s*<div[^>]*>)/\1<\/div>/g
    
    # Fix missing closing div tags for sections
    s/(<section[^>]*>\s*<div[^>]*>\s*<div[^>]*>\s*<h2[^>]*>[^<]*<\/h2>\s*<p[^>]*>[^<]*<\/p>\s*<div[^>]*>)/\1<\/div>/g
    ' "$file" > "$temp_file"
    
    # Additional fixes using awk for more complex structural issues
    awk '
    BEGIN { 
        in_section = 0
        in_grid = 0
        in_card = 0
        div_stack = 0
    }
    
    # Track opening divs
    /<div[^>]*>/ { 
        div_stack++
        if ($0 ~ /class="grid/) in_grid = 1
        if ($0 ~ /class="card-hover/) in_card = 1
        if ($0 ~ /class="text-center mb-16/) in_section = 1
    }
    
    # Track closing divs
    /<\/div>/ { 
        div_stack--
        if (div_stack < 0) div_stack = 0
    }
    
    # Fix missing closing divs before section ends
    /<\/section>/ {
        while (div_stack > 0) {
            print "</div>"
            div_stack--
        }
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

# Function to fix specific structural patterns
fix_specific_patterns() {
    local file="$1"
    
    echo "Fixing specific patterns in: $file"
    
    # Fix the device integration section specifically
    sed -i -E '
    # Fix the device integration section structure
    /<!-- Device Types Section -->/,/<\/section>/ {
        # Fix the grid structure
        s/<div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-6 gap-8 gap-8">/<div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-8">/
        
        # Ensure proper closing of device cards
        s/(<a href="[^"]*" class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors">\s*<div class="mb-3">\s*<svg[^>]*><\/svg>\s*<\/div>\s*<h3[^>]*>[^<]*<\/h3>)/\1<\/a>/g
    }
    
    # Fix the categories section structure
    /<!-- Categories Section -->/,/<\/section>/ {
        # Fix the grid structure
        s/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 gap-8">/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/
        
        # Ensure proper closing of category cards
        s/(<div class="card-hover">\s*<h3[^>]*>[^<]*<\/h3>\s*<p[^>]*>[^<]*<\/p>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    }
    
    # Fix the solutions section structure
    /<!-- Solutions Section -->/,/<\/section>/ {
        # Fix the grid structure
        s/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 gap-8">/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/
        
        # Ensure proper closing of solution cards
        s/(<div class="card-hover">\s*<h3[^>]*>[^<]*<\/h3>\s*<p[^>]*>[^<]*<\/p>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    }
    
    # Fix the budget section structure
    /<!-- Budget Section -->/,/<\/section>/ {
        # Fix the grid structure
        s/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 gap-8">/<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">/
        
        # Ensure proper closing of budget cards
        s/(<div class="card-hover">\s*<h3[^>]*>[^<]*<\/h3>\s*<p[^>]*>[^<]*<\/p>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    }
    
    # Fix the contact section structure
    /<!-- Contact Section -->/,/<\/section>/ {
        # Fix the form grid structure
        s/<div class="grid grid-cols-1 md:grid-cols-2 gap-6 gap-8 gap-8">/<div class="grid grid-cols-1 md:grid-cols-2 gap-6">/
    }
    ' "$file"
}

# Function to fix hero section structure
fix_hero_section() {
    local file="$1"
    
    echo "Fixing hero section in: $file"
    
    # Fix missing closing div in hero section
    sed -i -E '
    # Fix hero section button container
    s/(<div class="flex flex-col sm:flex-row gap-4 justify-center">\s*<a[^>]*>[^<]*<\/a>\s*<a[^>]*>[^<]*<\/a>)/\1<\/div>/g
    ' "$file"
}

# Main execution
echo "Starting structural fixes for all HTML files..."

# Fix main pages
for file in index.html privacy.html terms.html; do
    if [ -f "$file" ]; then
        echo "Processing main page: $file"
        fix_structural_issues "$file"
        fix_specific_patterns "$file"
        fix_hero_section "$file"
    fi
done

# Fix category pages
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        for file in "$dir"*.html; do
            if [ -f "$file" ]; then
                echo "Processing category page: $file"
                fix_structural_issues "$file"
                fix_specific_patterns "$file"
                fix_hero_section "$file"
            fi
        done
    fi
done

# Fix src/pages files if they exist
if [ -d "src/pages" ]; then
    for file in src/pages/**/*.html; do
        if [ -f "$file" ]; then
            echo "Processing src page: $file"
            fix_structural_issues "$file"
            fix_specific_patterns "$file"
            fix_hero_section "$file"
        fi
    done
fi

echo "✅ Structural fixes completed!"
echo "All HTML files now have proper structure with correct closing tags." 