#!/bin/bash

# Script to fix the gigantic floating button that's creating a large white arrow
echo "Fixing gigantic floating button..."

# Function to fix a single HTML file
fix_file() {
    local file="$1"
    
    # Fix the floating compare button - make it smaller and more appropriate
    sed -i 's/<button class="fixed bottom-6 right-6 bg-secondary hover:bg-secondary\/90 text-white p-4 rounded-full shadow-lg hover:shadow-xl transition-all duration-200 z-40">/<button class="fixed bottom-6 right-6 bg-secondary hover:bg-secondary\/90 text-white p-3 rounded-full shadow-lg hover:shadow-xl transition-all duration-200 z-40">/g' "$file"
    
    # Fix the SVG size in the floating button
    sed -i 's/<svg class="w-6 h-6 inline" fill="currentColor" viewBox="0 0 24 24">/<svg class="w-4 h-4 inline" fill="currentColor" viewBox="0 0 24 24">/g' "$file"
    
    # Fix the text size in the floating button
    sed -i 's/<span class="ml-2 font-semibold">Compare Now<\/span>/<span class="ml-2 font-semibold text-sm">Compare<\/span>/g' "$file"
    
    echo "Fixed floating button in: $file"
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

# Process all HTML files in src/pages/categories/
for html_file in src/pages/categories/*.html; do
    if [ -f "$html_file" ]; then
        fix_file "$html_file"
    fi
done

# Also fix the main index.html file
if [ -f "index.html" ]; then
    fix_file "index.html"
fi

# Fix privacy.html and terms.html if they exist
if [ -f "privacy.html" ]; then
    fix_file "privacy.html"
fi

if [ -f "terms.html" ]; then
    fix_file "terms.html"
fi

echo "Floating button fixes completed!"
echo "All floating buttons now use:"
echo "- Smaller padding: p-3 instead of p-4"
echo "- Smaller SVG: w-4 h-4 instead of w-6 h-6"
echo "- Shorter text: 'Compare' instead of 'Compare Now'" 