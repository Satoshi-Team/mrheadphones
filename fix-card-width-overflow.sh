#!/bin/bash

echo "🔧 Fixing card width and text overflow issues..."

# Function to fix card width and overflow issues
fix_card_width_overflow() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix card-hover elements to ensure proper width and prevent text overflow
    sed -i 's/class="card-hover"/class="card-hover w-full min-w-0 overflow-hidden"/g' "$file"
    
    # Fix grid containers to ensure proper spacing and prevent overflow
    sed -i 's/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8 w-full"/g' "$file"
    
    # Fix content containers to prevent text overflow
    sed -i 's/class="text-center mb-4 content-container"/class="text-center mb-4 content-container w-full min-w-0"/g' "$file"
    
    # Fix text elements to prevent overflow
    sed -i 's/class="text-sm"/class="text-sm break-words"/g' "$file"
    sed -i 's/class="font-heading font-semibold text-xl mb-2"/class="font-heading font-semibold text-xl mb-2 break-words"/g' "$file"
    sed -i 's/class="font-heading font-semibold text-lg mb-3"/class="font-heading font-semibold text-lg mb-3 break-words"/g' "$file"
    
    # Fix space-y-3 containers to prevent overflow
    sed -i 's/class="space-y-3 mb-6"/class="space-y-3 mb-6 w-full min-w-0"/g' "$file"
    
    # Fix flex items to prevent overflow
    sed -i 's/class="flex items-center flex-shrink-0"/class="flex items-center flex-shrink-0 w-full min-w-0"/g' "$file"
    
    # Fix related articles grid
    sed -i 's/class="related-articles-grid gap-8"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8 w-full"/g' "$file"
    
    # Fix related article buttons to prevent overflow
    sed -i 's/class="related-article-btn"/class="related-article-btn w-full min-w-0 overflow-hidden"/g' "$file"
    
    # Fix device cards grid to ensure proper spacing
    sed -i 's/class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-8"/class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4 md:gap-6 lg:gap-8 w-full"/g' "$file"
    
    # Fix device cards to prevent overflow
    sed -i 's/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors"/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors w-full min-w-0 overflow-hidden"/g' "$file"
    
    # Fix device card headings to prevent overflow
    sed -i 's/class="font-heading font-semibold"/class="font-heading font-semibold break-words text-sm sm:text-base"/g' "$file"
    
    # Fix content-container-wide to ensure full width
    sed -i 's/class="content-container-wide"/class="content-container-wide w-full max-w-none"/g' "$file"
    
    # Fix content-container to ensure proper width
    sed -i 's/class="content-container"/class="content-container w-full max-w-none"/g' "$file"
    
    echo "✅ Fixed: $file"
}

# Fix all category pages
echo "📁 Processing category pages..."
for file in categories/*/index.html; do
    if [ -f "$file" ]; then
        fix_card_width_overflow "$file"
    fi
done

# Fix all src/pages files
echo "📁 Processing src/pages files..."
for file in src/pages/**/*.html; do
    if [ -f "$file" ]; then
        fix_card_width_overflow "$file"
    fi
done

# Fix main pages
echo "📁 Processing main pages..."
for file in privacy.html terms.html; do
    if [ -f "$file" ]; then
        fix_card_width_overflow "$file"
    fi
done

# Fix homepage
echo "📁 Processing homepage..."
fix_card_width_overflow "index.html"

echo "🎉 All card width and overflow issues have been fixed!"
echo "📋 Summary of fixes applied:"
echo "   - Added w-full and min-w-0 classes to prevent overflow"
echo "   - Added break-words to text elements"
echo "   - Fixed grid spacing and container widths"
echo "   - Ensured proper responsive text sizing"
echo "   - Fixed content container widths" 