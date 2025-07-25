#!/bin/bash

echo "🎨 Applying header styling improvements to restored content..."

# Function to apply header styling to a file
apply_header_styling() {
    local file="$1"
    local page_name="$2"
    
    echo "Applying header styling to $page_name..."
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Apply header styling improvements
    sed -i 's/<div class="hidden lg:flex items-center space-x-6 xl:space-x-8">/<div class="hidden lg:flex items-center space-x-8 xl:space-x-10 2xl:space-x-12">/g' "$file"
    
    sed -i 's/class="nav-link text-sm xl:text-base"/class="nav-link text-sm xl:text-base font-medium px-4 py-2 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 transition-all duration-200"/g' "$file"
    
    sed -i 's/<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">/<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 xl:px-12">/g' "$file"
    
    sed -i 's/<div class="flex justify-between items-center h-16 sm:h-18 lg:h-20">/<div class="flex justify-between items-center h-16 sm:h-18 lg:h-20 xl:h-22">/g' "$file"
    
    sed -i 's/<a href="\/" class="flex items-center space-x-2 sm:space-x-3 group">/<a href="\/" class="flex items-center space-x-3 sm:space-x-4 group">/g' "$file"
    
    sed -i 's/<div class="flex items-center space-x-2 sm:space-x-3">/<div class="flex items-center space-x-3 sm:space-x-4">/g' "$file"
    
    echo "✅ Applied header styling to $page_name"
}

# Apply to category pages
echo "Applying header styling to category pages..."

# Apply to all category directories
find categories -name "index.html" | while read -r file; do
    dir_name=$(dirname "$file" | sed 's/categories\///')
    page_name=$(echo "$dir_name" | sed 's/-/ /g' | sed 's/\b\w/\U&/g')
    apply_header_styling "$file" "$page_name"
done

# Apply to src/pages category files
echo "Applying header styling to src/pages category files..."
find src/pages/categories -name "*.html" | while read -r file; do
    filename=$(basename "$file" .html)
    page_name=$(echo "$filename" | sed 's/-/ /g' | sed 's/\b\w/\U&/g')
    apply_header_styling "$file" "$page_name"
done

# Apply to other pages
echo "Applying header styling to other pages..."
apply_header_styling "privacy.html" "Privacy"
apply_header_styling "terms.html" "Terms"

echo "✅ Header styling applied to all restored content!" 