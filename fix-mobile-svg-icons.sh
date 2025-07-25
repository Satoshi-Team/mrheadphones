#!/bin/bash

echo "🔧 Fixing mobile SVG icon sizing for better responsiveness..."

# Function to fix SVG icon sizing in a file
fix_svg_icons() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix SVG icon sizing to be more responsive on mobile
    # Change w-12 h-12 to responsive sizing: smaller on mobile, larger on desktop
    sed -i 's/class="w-12 h-12 mx-auto"/class="w-8 h-8 sm:w-10 sm:h-10 lg:w-12 lg:h-12 mx-auto"/g' "$file"
    
    # Also fix any other SVG icons that might be too large
    sed -i 's/class="w-8 h-8"/class="w-6 h-6 sm:w-8 sm:h-8"/g' "$file"
    sed -i 's/class="w-10 h-10"/class="w-8 h-8 sm:w-10 sm:h-10"/g' "$file"
}

# Fix homepage SVG icons
echo "Fixing homepage SVG icons..."
fix_svg_icons "index.html"

# Fix category pages SVG icons
echo "Fixing category pages SVG icons..."
find categories -name "index.html" | while read -r file; do
    fix_svg_icons "$file"
done

# Fix src/pages category files
echo "Fixing src/pages category files..."
find src/pages/categories -name "*.html" | while read -r file; do
    fix_svg_icons "$file"
done

# Fix other pages
echo "Fixing other pages..."
fix_svg_icons "privacy.html"
fix_svg_icons "terms.html"

echo "✅ Mobile SVG icon sizing fixed throughout the application!" 