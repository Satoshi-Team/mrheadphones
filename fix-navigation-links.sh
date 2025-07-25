#!/bin/bash

echo "🔧 Fixing navigation links throughout the application..."

# Function to fix navigation links in a file
fix_navigation_links() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix navigation links to go to homepage first, then to sections
    sed -i 's|href="/#home"|href="/#home"|g' "$file"
    sed -i 's|href="/#categories"|href="/#categories"|g' "$file"
    sed -i 's|href="/#devices"|href="/#devices"|g' "$file"
    sed -i 's|href="/#solutions"|href="/#solutions"|g' "$file"
    sed -i 's|href="/#budget"|href="/#budget"|g' "$file"
    sed -i 's|href="/#contact"|href="/#contact"|g' "$file"
    
    # Fix footer links to go to homepage first, then to sections
    sed -i 's|href="/#home"|href="/#home"|g' "$file"
    sed -i 's|href="/#categories"|href="/#categories"|g' "$file"
    sed -i 's|href="/#devices"|href="/#devices"|g' "$file"
    sed -i 's|href="/#solutions"|href="/#solutions"|g' "$file"
    sed -i 's|href="/#budget"|href="/#budget"|g' "$file"
    sed -i 's|href="/#contact"|href="/#contact"|g' "$file"
}

# Function to fix category page navigation links specifically
fix_category_navigation_links() {
    local file="$1"
    echo "Processing category page: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix navigation links to go to homepage first, then to sections
    sed -i 's|href="/#home"|href="/#home"|g' "$file"
    sed -i 's|href="/#categories"|href="/#categories"|g' "$file"
    sed -i 's|href="/#devices"|href="/#devices"|g' "$file"
    sed -i 's|href="/#solutions"|href="/#solutions"|g' "$file"
    sed -i 's|href="/#budget"|href="/#budget"|g' "$file"
    sed -i 's|href="/#contact"|href="/#contact"|g' "$file"
    
    # Fix footer links to go to homepage first, then to sections
    sed -i 's|href="/#home"|href="/#home"|g' "$file"
    sed -i 's|href="/#categories"|href="/#categories"|g' "$file"
    sed -i 's|href="/#devices"|href="/#devices"|g' "$file"
    sed -i 's|href="/#solutions"|href="/#solutions"|g' "$file"
    sed -i 's|href="/#budget"|href="/#budget"|g' "$file"
    sed -i 's|href="/#contact"|href="/#contact"|g' "$file"
}

# Fix homepage navigation (should stay as is)
echo "Fixing homepage navigation..."
fix_navigation_links "index.html"

# Fix category pages navigation
echo "Fixing category pages navigation..."
find categories -name "index.html" | while read -r file; do
    fix_category_navigation_links "$file"
done

# Fix src/pages category files
echo "Fixing src/pages category files..."
find src/pages/categories -name "*.html" | while read -r file; do
    fix_category_navigation_links "$file"
done

# Fix other pages (privacy, terms)
echo "Fixing other pages..."
fix_navigation_links "privacy.html"
fix_navigation_links "terms.html"

echo "✅ Navigation links fixed throughout the application!" 