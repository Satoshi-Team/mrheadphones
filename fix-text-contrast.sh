#!/bin/bash

echo "🎨 Fixing text contrast for better readability..."

# Function to fix text contrast in a file
fix_text_contrast() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Improve text contrast for better readability
    
    # Fix paragraph text - make it darker for better contrast
    sed -i 's/text-gray-600 dark:text-gray-300/text-gray-700 dark:text-gray-200/g' "$file"
    
    # Fix any remaining gray-600 text
    sed -i 's/text-gray-600/text-gray-700/g' "$file"
    
    # Fix any gray-300 text in dark mode
    sed -i 's/dark:text-gray-300/dark:text-gray-200/g' "$file"
    
    # Fix any gray-400 text
    sed -i 's/text-gray-400/text-gray-600/g' "$file"
    sed -i 's/dark:text-gray-400/dark:text-gray-300/g' "$file"
    
    # Fix any gray-500 text
    sed -i 's/text-gray-500/text-gray-600/g' "$file"
    sed -i 's/dark:text-gray-500/dark:text-gray-300/g' "$file"
}

# Fix homepage text contrast
echo "Fixing homepage text contrast..."
fix_text_contrast "index.html"

# Fix category pages text contrast
echo "Fixing category pages text contrast..."
find categories -name "index.html" | while read -r file; do
    fix_text_contrast "$file"
done

# Fix src/pages category files
echo "Fixing src/pages category files..."
find src/pages/categories -name "*.html" | while read -r file; do
    fix_text_contrast "$file"
done

# Fix other pages
echo "Fixing other pages..."
fix_text_contrast "privacy.html"
fix_text_contrast "terms.html"

echo "✅ Text contrast fixed for better readability!" 