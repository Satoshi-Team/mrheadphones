#!/bin/bash

echo "🔧 Final comprehensive fix for card layout and text truncation..."

# Function to fix card layout issues
fix_card_layout_final() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix grid containers to use fewer columns and more space
    sed -i 's/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8 w-full"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-8 w-full max-w-7xl mx-auto"/g' "$file"
    
    # Fix device cards grid to use fewer columns
    sed -i 's/class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4 md:gap-6 lg:gap-8 w-full"/class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-6 w-full max-w-7xl mx-auto"/g' "$file"
    
    # Fix card-hover elements with better spacing and text handling
    sed -i 's/class="card-hover w-full min-w-0 overflow-hidden"/class="card-hover w-full p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700"/g' "$file"
    
    # Fix device cards with better styling
    sed -i 's/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors w-full min-w-0 overflow-hidden"/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors w-full p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700"/g' "$file"
    
    # Fix text elements with better wrapping and sizing
    sed -i 's/class="text-sm break-words"/class="text-sm break-words leading-relaxed"/g' "$file"
    sed -i 's/class="font-heading font-semibold text-xl mb-2 break-words"/class="font-heading font-semibold text-xl mb-3 break-words leading-tight"/g' "$file"
    sed -i 's/class="font-heading font-semibold text-lg mb-3 break-words"/class="font-heading font-semibold text-lg mb-3 break-words leading-tight"/g' "$file"
    sed -i 's/class="font-heading font-semibold break-words text-sm sm:text-base"/class="font-heading font-semibold break-words text-base leading-tight"/g' "$file"
    
    # Fix content containers with better width handling
    sed -i 's/class="text-center mb-4 content-container w-full min-w-0"/class="text-center mb-4 w-full"/g' "$file"
    
    # Fix space-y-3 containers with better spacing
    sed -i 's/class="space-y-3 mb-6 w-full min-w-0"/class="space-y-4 mb-6 w-full"/g' "$file"
    
    # Fix flex items with better text handling
    sed -i 's/class="flex items-center flex-shrink-0 w-full min-w-0"/class="flex items-start space-x-2 w-full"/g' "$file"
    
    # Fix related articles grid
    sed -i 's/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8 w-full"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-8 w-full max-w-7xl mx-auto"/g' "$file"
    
    # Fix related article buttons
    sed -i 's/class="related-article-btn w-full min-w-0 overflow-hidden"/class="related-article-btn w-full p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700"/g' "$file"
    
    # Fix content-container-wide to ensure proper width
    sed -i 's/class="content-container-wide w-full max-w-none"/class="content-container-wide w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"/g' "$file"
    
    # Fix content-container to ensure proper width
    sed -i 's/class="content-container w-full max-w-none"/class="content-container w-full max-w-4xl mx-auto px-4 sm:px-6 lg:px-8"/g' "$file"
    
    # Fix text elements in cards to prevent truncation
    sed -i 's/class="text-gray-600 dark:text-gray-300 mb-4 responsive-text text-gray-200"/class="text-gray-600 dark:text-gray-300 mb-4 leading-relaxed"/g' "$file"
    
    # Fix span elements in feature lists
    sed -i 's/class="text-sm"/class="text-sm leading-relaxed flex-1"/g' "$file"
    
    # Fix section padding for better spacing
    sed -i 's/class="section-padding"/class="py-16 lg:py-24"/g' "$file"
    
    echo "✅ Fixed: $file"
}

# Fix all category pages
echo "📁 Processing category pages..."
for file in categories/*/index.html; do
    if [ -f "$file" ]; then
        fix_card_layout_final "$file"
    fi
done

# Fix all src/pages files
echo "📁 Processing src/pages files..."
for file in src/pages/**/*.html; do
    if [ -f "$file" ]; then
        fix_card_layout_final "$file"
    fi
done

# Fix main pages
echo "📁 Processing main pages..."
for file in privacy.html terms.html; do
    if [ -f "$file" ]; then
        fix_card_layout_final "$file"
    fi
done

# Fix homepage
echo "📁 Processing homepage..."
fix_card_layout_final "index.html"

echo "🎉 Final card layout fixes applied!"
echo "📋 Summary of fixes applied:"
echo "   - Reduced grid columns to give cards more space"
echo "   - Added proper padding and spacing to cards"
echo "   - Improved text wrapping and line height"
echo "   - Fixed container widths and max-widths"
echo "   - Enhanced card styling with better shadows and borders"
echo "   - Improved responsive design with better breakpoints" 