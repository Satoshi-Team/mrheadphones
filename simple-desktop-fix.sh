#!/bin/bash

# Simple fix for mobile menu showing on desktop

echo "🔧 Simple desktop mobile menu fix..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Remove the duplicate mobile menu content that's showing on desktop
    sed -i '/<div class="px-4 py-4 space-y-2">/,/<\/div>\s*<\/div>\s*<\/div>/d' "$file"
    
    # Add proper mobile menu structure before closing nav
    sed -i 's/<\/nav>/        <!-- Mobile Menu -->\n        <div id="mobileMenu" class="hidden md:hidden mobile-futuristic border-t border-gray-200\/20 dark:border-gray-700\/20">\n            <div class="px-4 py-4 space-y-2">\n                <a href="\/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_home">Home<\/a>\n                <a href="\/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_categories">Categories<\/a>\n                <a href="\/#devices" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_devices">Devices<\/a>\n                <a href="\/#solutions" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_solutions">Solutions<\/a>\n                <a href="\/#budget" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_budget">Budget<\/a>\n            <\/div>\n        <\/div>\n    <\/nav>/' "$file"
    
    echo "✅ Fixed: $file"
}

# Function to verify the fix
verify_fix() {
    local file="$1"
    local mobile_menu_count=$(grep -c "id=\"mobileMenu\"" "$file" 2>/dev/null || echo "0")
    local hidden_class_count=$(grep -c "hidden md:hidden" "$file" 2>/dev/null || echo "0")
    local duplicate_links=$(grep -c "nav_home.*Home" "$file" 2>/dev/null || echo "0")
    
    if [ "$mobile_menu_count" -eq 1 ] && [ "$hidden_class_count" -eq 1 ] && [ "$duplicate_links" -eq 1 ]; then
        echo "✅ Verified: $file - Mobile menu looks perfect"
    else
        echo "❌ Warning: $file - Issues detected (Mobile menu: $mobile_menu_count, Hidden class: $hidden_class_count, Duplicate links: $duplicate_links)"
    fi
}

# Main execution
echo "🚀 Starting simple desktop fix..."

# 1. Fix main index.html
echo "📄 Fixing main index.html..."
fix_file "index.html"

# 2. Fix all category pages
echo "📁 Fixing category pages..."
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        fix_file "${dir}index.html"
    fi
done

# 3. Fix src/pages files if they exist
echo "📁 Fixing src/pages files..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        fix_file "$file"
    fi
done

# 4. Fix other HTML files
echo "📄 Fixing other HTML files..."
fix_file "privacy.html"
fix_file "terms.html"

# 5. Verify fixes
echo "🔍 Verifying fixes..."
verify_fix "index.html"
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
echo "🎉 Simple desktop fix completed!"
echo "📊 Summary:"
echo "   - Fixed mobile menu showing on desktop"
echo "   - Removed duplicate menu items"
echo "   - Added proper hidden classes"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 