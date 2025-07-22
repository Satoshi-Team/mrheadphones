#!/bin/bash

# Script to update footer links to point to privacy.html and terms.html
echo "Updating footer links to point to privacy.html and terms.html..."

# Function to fix a single HTML file
fix_file() {
    local file="$1"
    
    # Update footer links to point to the new privacy and terms pages
    sed -i 's/<a href="#" class="text-gray-300 hover:text-white transition-colors">Privacy<\/a>/<a href="\/privacy.html" class="text-gray-300 hover:text-white transition-colors">Privacy<\/a>/g' "$file"
    sed -i 's/<a href="#" class="text-gray-300 hover:text-white transition-colors">Terms<\/a>/<a href="\/terms.html" class="text-gray-300 hover:text-white transition-colors">Terms<\/a>/g' "$file"
    
    echo "Updated footer links: $file"
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

echo "Footer links update completed!"
echo "All pages now link to privacy.html and terms.html" 