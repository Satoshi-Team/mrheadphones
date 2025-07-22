#!/bin/bash

# Script to update footer copyright year from 2024 to 2025
echo "Updating footer copyright year from 2024 to 2025..."

# Function to fix a single HTML file
fix_file() {
    local file="$1"
    
    # Replace 2024 with 2025 in copyright notices
    sed -i 's/© 2024 MrHeadphones.com/© 2025 MrHeadphones.com/g' "$file"
    sed -i 's/2024 MrHeadphones.com/2025 MrHeadphones.com/g' "$file"
    
    echo "Updated: $file"
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

# Fix the privacy and terms pages
if [ -f "privacy.html" ]; then
    fix_file "privacy.html"
fi

if [ -f "terms.html" ]; then
    fix_file "terms.html"
fi

echo "Footer year updates completed!"
echo "All pages now show © 2025 MrHeadphones.com" 