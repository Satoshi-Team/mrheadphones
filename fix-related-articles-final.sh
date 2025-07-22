#!/bin/bash

# Script to properly fix Related Articles sections with beautiful CTA buttons
echo "Fixing Related Articles sections with beautiful CTA buttons..."

# Function to fix a single HTML file
fix_file() {
    local file="$1"
    
    # First, revert any accidental changes to footer links by removing the btn-arrow spans
    sed -i 's/<span class="btn-arrow">Read More <svg class="w-4 h-4 ml-1" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"><\/path><\/svg><\/span>//g' "$file"
    
    # Replace feature-grid with related-articles-grid in the related articles section
    sed -i 's/<div class="feature-grid">/<div class="related-articles-grid">/g' "$file"
    
    # Replace card-hover with related-article-btn in the related articles section
    sed -i 's/<a href="\([^"]*\)" class="card-hover">/<a href="\1" class="related-article-btn">/g' "$file"
    
    # Clean up any existing related article buttons and add proper structure
    # Remove any existing btn-arrow spans in related articles
    sed -i '/<!-- Related Articles -->/,/<\/div>/s/<span class="btn-arrow">[^<]*<\/span>//g' "$file"
    
    # Add proper structure to related article buttons
    sed -i '/<!-- Related Articles -->/,/<\/div>/s/<h3 class="font-heading font-semibold text-lg mb-2">\([^<]*\)<\/h3>/<h3>\1<\/h3>/g' "$file"
    sed -i '/<!-- Related Articles -->/,/<\/div>/s/<p class="text-gray-600 dark:text-gray-300">\([^<]*\)<\/p>/<p>\1<\/p>/g' "$file"
    
    # Add the Read More button with arrow to each related article
    sed -i '/<!-- Related Articles -->/,/<\/div>/s/<\/a>/<span class="btn-arrow">Read More <svg class="w-4 h-4 ml-1" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"><\/path><\/svg><\/span><\/a>/g' "$file"
    
    echo "Fixed Related Articles: $file"
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

# Also fix the main index.html file if it has related articles
if [ -f "index.html" ]; then
    fix_file "index.html"
fi

echo "Related Articles CTA buttons fix completed!"
echo "All pages now have beautiful, uniform CTA buttons for related articles" 