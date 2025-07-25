#!/bin/bash

echo "🎨 Fixing text colors for proper dark/light mode readability..."

# Function to fix text colors in a file
fix_text_colors() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix text colors for better readability in both modes
    # Improve contrast for better accessibility
    
    # Fix paragraph text - make it darker in light mode and lighter in dark mode
    sed -i 's/text-gray-600 dark:text-gray-300/text-gray-700 dark:text-gray-200/g' "$file"
    
    # Fix heading text - ensure proper contrast
    sed -i 's/text-gray-900 dark:text-white/text-gray-900 dark:text-white/g' "$file"
    
    # Fix any remaining gray-600 text that might be too light
    sed -i 's/text-gray-600/text-gray-700/g' "$file"
    
    # Fix any gray-300 text in dark mode that might be too light
    sed -i 's/dark:text-gray-300/dark:text-gray-200/g' "$file"
    
    # Fix any gray-400 text that might be too light
    sed -i 's/text-gray-400/text-gray-600/g' "$file"
    sed -i 's/dark:text-gray-400/dark:text-gray-300/g' "$file"
    
    # Fix any gray-500 text that might be too light
    sed -i 's/text-gray-500/text-gray-600/g' "$file"
    sed -i 's/dark:text-gray-500/dark:text-gray-300/g' "$file"
    
    # Ensure proper contrast for small text
    sed -i 's/text-sm text-gray-600/text-sm text-gray-700 dark:text-gray-200/g' "$file"
    
    # Fix any text that might be too light on light backgrounds
    sed -i 's/text-gray-300/text-gray-600/g' "$file"
    
    # Fix any text that might be too dark on dark backgrounds
    sed -i 's/dark:text-gray-800/dark:text-gray-100/g' "$file"
}

# Function to fix specific problematic text patterns
fix_specific_text_issues() {
    local file="$1"
    
    # Fix any text that has conflicting color classes
    sed -i 's/text-gray-600 dark:text-gray-300 text-gray-200/text-gray-700 dark:text-gray-200/g' "$file"
    
    # Fix any text that might be too light
    sed -i 's/text-gray-300 dark:text-gray-300/text-gray-600 dark:text-gray-200/g' "$file"
    
    # Fix any text that might be too dark in dark mode
    sed -i 's/text-gray-900 dark:text-gray-900/text-gray-900 dark:text-white/g' "$file"
    
    # Fix any text that might be too light in light mode
    sed -i 's/text-gray-200 dark:text-gray-200/text-gray-700 dark:text-gray-200/g' "$file"
}

# Fix homepage text colors
echo "Fixing homepage text colors..."
fix_text_colors "index.html"
fix_specific_text_issues "index.html"

# Fix category pages text colors
echo "Fixing category pages text colors..."
find categories -name "index.html" | while read -r file; do
    fix_text_colors "$file"
    fix_specific_text_issues "$file"
done

# Fix src/pages category files
echo "Fixing src/pages category files..."
find src/pages/categories -name "*.html" | while read -r file; do
    fix_text_colors "$file"
    fix_specific_text_issues "$file"
done

# Fix other pages
echo "Fixing other pages..."
fix_text_colors "privacy.html"
fix_specific_text_issues "privacy.html"
fix_text_colors "terms.html"
fix_specific_text_issues "terms.html"

echo "✅ Text colors fixed for proper dark/light mode readability!" 