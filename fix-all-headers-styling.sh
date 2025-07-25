#!/bin/bash

echo "🎨 Applying consistent header styling to all pages..."

# Function to fix header styling in a file
fix_header_styling() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Improve desktop navigation container spacing and styling
    sed -i 's/<div class="hidden lg:flex items-center space-x-6 xl:space-x-8">/<div class="hidden lg:flex items-center space-x-8 xl:space-x-10 2xl:space-x-12">/g' "$file"
    
    # Enhance nav-link styling to match mobile beauty
    sed -i 's/class="nav-link text-sm xl:text-base"/class="nav-link text-sm xl:text-base font-medium px-4 py-2 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 transition-all duration-200"/g' "$file"
    
    # Improve header container padding and spacing
    sed -i 's/<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">/<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 xl:px-12">/g' "$file"
    
    # Enhance header height and spacing
    sed -i 's/<div class="flex justify-between items-center h-16 sm:h-18 lg:h-20">/<div class="flex justify-between items-center h-16 sm:h-18 lg:h-20 xl:h-22">/g' "$file"
    
    # Improve logo spacing
    sed -i 's/<a href="\/" class="flex items-center space-x-2 sm:space-x-3 group">/<a href="\/" class="flex items-center space-x-3 sm:space-x-4 group">/g' "$file"
    
    # Enhance right side controls spacing
    sed -i 's/<div class="flex items-center space-x-2 sm:space-x-3">/<div class="flex items-center space-x-3 sm:space-x-4">/g' "$file"
}

# Fix category pages
echo "Fixing category pages..."
find categories -name "index.html" | while read -r file; do
    fix_header_styling "$file"
done

# Fix src/pages category files
echo "Fixing src/pages category files..."
find src/pages/categories -name "*.html" | while read -r file; do
    fix_header_styling "$file"
done

# Fix other pages
echo "Fixing other pages..."
fix_header_styling "privacy.html"
fix_header_styling "terms.html"

echo "✅ All headers styled consistently!" 