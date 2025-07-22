#!/bin/bash

# Comprehensive script to fix all padding issues across all pages
echo "Performing comprehensive padding fixes..."

# Function to fix a single HTML file
fix_file() {
    local file="$1"
    
    # Fix hero section paragraph class (remove incorrect content-container-narrow)
    sed -i 's/content-container-narrow/max-w-3xl mx-auto/g' "$file"
    
    # Fix footer container (replace old max-w-7xl with content-container-wide)
    sed -i 's/<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">/<div class="content-container-wide">/g' "$file"
    
    # Fix navigation container (ensure it uses content-container-wide)
    sed -i 's/<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">/<div class="content-container-wide">/g' "$file"
    
    # Fix any remaining max-w-4xl mx-auto container-padding
    sed -i 's/max-w-4xl mx-auto container-padding/content-container/g' "$file"
    
    # Fix any remaining max-w-4xl mx-auto px-4 sm:px-6 lg:px-8
    sed -i 's/max-w-4xl mx-auto px-4 sm:px-6 lg:px-8/content-container/g' "$file"
    
    # Fix any remaining max-w-3xl mx-auto (for hero text)
    sed -i 's/max-w-3xl mx-auto/max-w-4xl mx-auto/g' "$file"
    
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

echo "Comprehensive padding fixes completed!"
echo "All pages now use:"
echo "- content-container (max-w-6xl) for main content sections"
echo "- content-container-wide (max-w-7xl) for navigation and footer"
echo "- max-w-4xl for hero text (better readability)" 