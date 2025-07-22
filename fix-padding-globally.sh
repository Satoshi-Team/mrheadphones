#!/bin/bash

# Script to fix padding issues across all category pages
# This script replaces narrow container classes with wider, more appropriate ones

echo "Fixing padding issues across all category pages..."

# Function to fix a single HTML file
fix_file() {
    local file="$1"
    
    # Replace max-w-4xl mx-auto container-padding with content-container
    sed -i 's/max-w-4xl mx-auto container-padding/content-container/g' "$file"
    
    # Replace max-w-3xl mx-auto with content-container-narrow for hero sections
    sed -i 's/max-w-3xl mx-auto/content-container-narrow/g' "$file"
    
    # Replace max-w-7xl mx-auto container-padding with content-container-wide for footer
    sed -i 's/max-w-7xl mx-auto container-padding/content-container-wide/g' "$file"
    
    # Fix hero section container specifically
    sed -i 's/<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">/<div class="content-container text-center">/g' "$file"
    
    # Fix content section container
    sed -i 's/<div class="max-w-4xl mx-auto container-padding">/<div class="content-container">/g' "$file"
    
    # Fix footer container
    sed -i 's/<div class="max-w-7xl mx-auto container-padding">/<div class="content-container-wide">/g' "$file"
    
    echo "Fixed: $file"
}

# Process all category directories
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        html_file="$dir/index.html"
        if [ -f "$html_file" ]; then
            fix_file "$html_file"
        fi
    fi
done

# Also fix the main index.html file
if [ -f "index.html" ]; then
    fix_file "index.html"
fi

echo "Padding fixes completed!"
echo "All pages now use:"
echo "- content-container (max-w-6xl) for main content"
echo "- content-container-wide (max-w-7xl) for wide sections"
echo "- content-container-narrow (max-w-5xl) for narrow sections" 