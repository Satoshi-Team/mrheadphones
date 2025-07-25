#!/bin/bash

echo "🔧 Final fix for button positioning and card layout..."

# Function to fix button and card layout issues
fix_button_layout_final() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix card-hover elements to ensure proper structure and button containment
    sed -i 's/class="card-hover w-full p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700"/class="card-hover w-full p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full"/g' "$file"
    
    # Fix device cards to ensure proper structure
    sed -i 's/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors w-full p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700"/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors w-full p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full"/g' "$file"
    
    # Fix content containers within cards to use flex-1 for proper spacing
    sed -i 's/class="text-center mb-4 w-full"/class="text-center mb-4 w-full flex-1"/g' "$file"
    
    # Fix space-y-4 containers to use flex-1 for proper spacing
    sed -i 's/class="space-y-4 mb-6 w-full"/class="space-y-4 mb-6 w-full flex-1"/g' "$file"
    
    # Fix btn-product buttons to ensure they stay at the bottom of cards
    sed -i 's/class="btn-product"/class="btn-product mt-auto w-full text-center"/g' "$file"
    
    # Fix related article buttons to ensure proper structure
    sed -i 's/class="related-article-btn w-full p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700"/class="related-article-btn w-full p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full"/g' "$file"
    
    # Fix grid containers to ensure proper alignment
    sed -i 's/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-8 w-full max-w-7xl mx-auto"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-8 w-full max-w-7xl mx-auto items-stretch"/g' "$file"
    
    # Fix device cards grid to ensure proper alignment
    sed -i 's/class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-6 w-full max-w-7xl mx-auto"/class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-6 w-full max-w-7xl mx-auto items-stretch"/g' "$file"
    
    # Fix related articles grid
    sed -i 's/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-8 w-full max-w-7xl mx-auto"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-8 w-full max-w-7xl mx-auto items-stretch"/g' "$file"
    
    # Fix flex items to ensure proper text alignment
    sed -i 's/class="flex items-start space-x-2 w-full"/class="flex items-start space-x-2 w-full flex-shrink-0"/g' "$file"
    
    # Fix span elements in feature lists to ensure proper text wrapping
    sed -i 's/class="text-sm leading-relaxed flex-1"/class="text-sm leading-relaxed flex-1 min-w-0"/g' "$file"
    
    # Fix text elements to ensure proper wrapping
    sed -i 's/class="text-gray-600 dark:text-gray-300 mb-4 leading-relaxed"/class="text-gray-600 dark:text-gray-300 mb-4 leading-relaxed flex-1"/g' "$file"
    
    # Fix headings to ensure proper spacing
    sed -i 's/class="font-heading font-semibold text-xl mb-3 break-words leading-tight"/class="font-heading font-semibold text-xl mb-3 break-words leading-tight flex-shrink-0"/g' "$file"
    
    # Fix price elements to ensure proper positioning
    sed -i 's/class="text-2xl font-bold text-secondary mb-2 responsive-text text-gray-200 text-gray-300"/class="text-2xl font-bold text-secondary mb-2 flex-shrink-0"/g' "$file"
    
    echo "✅ Fixed: $file"
}

# Fix all category pages
echo "📁 Processing category pages..."
for file in categories/*/index.html; do
    if [ -f "$file" ]; then
        fix_button_layout_final "$file"
    fi
done

# Fix all src/pages files
echo "📁 Processing src/pages files..."
for file in src/pages/**/*.html; do
    if [ -f "$file" ]; then
        fix_button_layout_final "$file"
    fi
done

# Fix main pages
echo "📁 Processing main pages..."
for file in privacy.html terms.html; do
    if [ -f "$file" ]; then
        fix_button_layout_final "$file"
    fi
done

# Fix homepage
echo "📁 Processing homepage..."
fix_button_layout_final "index.html"

echo "🎉 Final button and card layout fixes applied!"
echo "📋 Summary of fixes applied:"
echo "   - Added flex flex-col h-full to cards for proper structure"
echo "   - Added flex-1 to content areas for proper spacing"
echo "   - Added mt-auto to buttons to keep them at bottom"
echo "   - Added items-stretch to grids for uniform card heights"
echo "   - Fixed button positioning and containment"
echo "   - Improved text wrapping and alignment" 