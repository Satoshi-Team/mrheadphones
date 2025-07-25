#!/bin/bash

echo "🔧 Fixing header backgrounds to be solid and consistent..."

# Function to fix header backgrounds in a file
fix_header_backgrounds() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix the main navigation background - make it solid
    sed -i 's/bg-white\/95 dark:bg-gray-900\/95/bg-white dark:bg-gray-900/g' "$file"
    
    # Fix the mobile menu background - make it solid
    sed -i 's/bg-white\/98 dark:bg-gray-900\/98/bg-white dark:bg-gray-900/g' "$file"
    
    # Fix hover states to be more visible
    sed -i 's/hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60/hover:bg-gray-100 dark:hover:bg-gray-700/g' "$file"
    
    # Fix border opacity to be more visible
    sed -i 's/border-gray-200\/50 dark:border-gray-700\/50/border-gray-200 dark:border-gray-700/g' "$file"
}

# Find all HTML files and apply the fix
find . -type f -name "*.html" | while read -r file; do
    fix_header_backgrounds "$file"
done

echo "✅ Header backgrounds fixed!" 