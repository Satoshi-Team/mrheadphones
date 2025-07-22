#!/bin/bash

# Script to replace large arrow SVGs with proper CTA buttons in related articles
echo "Replacing large arrow SVGs with proper CTA buttons in related articles..."

# Function to fix a single HTML file
fix_file() {
    local file="$1"
    
    # Replace the large arrow SVG with a proper CTA button
    # This replaces: <span class="btn-arrow">Read More <svg class="w-4 h-4 ml-1" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg></span>
    # With: <span class="btn-primary btn-sm">Read More</span>
    
    sed -i 's/<span class="btn-arrow">Read More <svg class="w-4 h-4 ml-1" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10\.293 3\.293a1 1 0 011\.414 0l6 6a1 1 0 010 1\.414l-6 6a1 1 0 01-1\.414-1\.414L14\.586 11H3a1 1 0 110-2h11\.586l-4\.293-4\.293a1 1 0 010-1\.414z" clip-rule="evenodd"><\/path><\/svg><\/span>/<span class="btn-primary btn-sm">Read More<\/span>/g' "$file"
    
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

# Also fix the main index.html file if it has related articles
if [ -f "index.html" ]; then
    fix_file "index.html"
fi

# Also fix files in src/pages/categories if they exist
for dir in src/pages/categories/*/; do
    if [ -d "$dir" ]; then
        html_file="$dir/index.html"
        if [ -f "$html_file" ]; then
            fix_file "$html_file"
        fi
    fi
done

echo "Related articles button fixes completed!"
echo "All large arrow SVGs have been replaced with proper CTA buttons." 