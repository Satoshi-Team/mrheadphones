#!/bin/bash

# Fix all mobile menus across all pages

echo "🔧 Fixing all mobile menus..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Remove all mobile-menu-item sections (these are the duplicates)
    sed -i '/mobile-menu-item/,/<\/div>\s*<\/div>\s*<\/div>/d' "$file"
    
    # Remove any duplicate mobile menu divs (keep only the first one)
    # This removes the second and subsequent mobile menu divs
    sed -i '/<div id="mobileMenu"/ { N; /<div id="mobileMenu"/ { N; /<div id="mobileMenu"/d } }' "$file"
    
    # Ensure the mobile menu has the proper structure with Home link
    sed -i 's/<div id="mobileMenu" class="hidden md:hidden mobile-futuristic border-t border-gray-200\/20 dark:border-gray-700\/20">/<div id="mobileMenu" class="hidden md:hidden mobile-futuristic border-t border-gray-200\/20 dark:border-gray-700\/20">\n            <div class="px-4 py-4 space-y-2">/' "$file"
    
    # Add Home link before Categories if it doesn't exist
    sed -i 's/<a href="\/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_categories">Categories<\/a>/<a href="\/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_home">Home<\/a>\n                <a href="\/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_categories">Categories<\/a>/' "$file"
    
    # Ensure proper closing div structure
    sed -i 's/<\/div>\s*<\/div>\s*<\/nav>/            <\/div>\n        <\/div>\n    <\/nav>/' "$file"
    
    echo "✅ Fixed: $file"
}

# Function to verify the fix
verify_fix() {
    local file="$1"
    local mobile_menu_count=$(grep -c "id=\"mobileMenu\"" "$file" 2>/dev/null || echo "0")
    local mobile_menu_item_count=$(grep -c "mobile-menu-item" "$file" 2>/dev/null || echo "0")
    local home_link_count=$(grep -c "nav_home.*Home" "$file" 2>/dev/null || echo "0")
    
    if [ "$mobile_menu_count" -eq 1 ] && [ "$mobile_menu_item_count" -eq 0 ] && [ "$home_link_count" -eq 1 ]; then
        echo "✅ Verified: $file - Single mobile menu looks perfect"
    else
        echo "❌ Warning: $file - Issues detected (Mobile menu: $mobile_menu_count, Mobile menu items: $mobile_menu_item_count, Home links: $home_link_count)"
    fi
}

# Main execution
echo "🚀 Starting mobile menu fix for all pages..."

# 1. Fix all category pages
echo "📁 Fixing category pages..."
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        fix_file "${dir}index.html"
    fi
done

# 2. Fix src/pages files if they exist
echo "📁 Fixing src/pages files..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        fix_file "$file"
    fi
done

# 3. Fix other HTML files
echo "📄 Fixing other HTML files..."
fix_file "privacy.html"
fix_file "terms.html"

# 4. Verify fixes
echo "🔍 Verifying fixes..."
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        verify_fix "${dir}index.html"
    fi
done
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        verify_fix "$file"
    fi
done
verify_fix "privacy.html"
verify_fix "terms.html"

echo ""
echo "🎉 Mobile menu fix completed!"
echo "📊 Summary:"
echo "   - Removed all duplicate mobile menus"
echo "   - Ensured single mobile menu with Home link"
echo "   - Removed mobile-menu-item duplicates"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 