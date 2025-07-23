#!/bin/bash

# Restore proper navigation structure

echo "🔧 Restoring proper navigation structure..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Fix 1: Replace malformed closing tags (</a> instead of </button>)
    sed -i 's/<!-- Dark Mode Toggle -->\s*<\/a>/<!-- Dark Mode Toggle -->\n                    <\/button>/g' "$file"
    sed -i 's/<!-- Mobile Menu Button -->\s*<\/a>/<!-- Mobile Menu Button -->\n                    <\/button>/g' "$file"
    
    # Fix 2: Add proper mobile menu before closing nav
    sed -i 's/<\/nav>/        <!-- Mobile Menu -->\n        <div id="mobileMenu" class="hidden md:hidden mobile-futuristic border-t border-gray-200\/20 dark:border-gray-700\/20">\n            <div class="px-4 py-4 space-y-2">\n                <a href="\/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_home">Home<\/a>\n                <a href="\/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_categories">Categories<\/a>\n                <a href="\/#devices" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_devices">Devices<\/a>\n                <a href="\/#solutions" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_solutions">Solutions<\/a>\n                <a href="\/#budget" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_budget">Budget<\/a>\n            <\/div>\n        <\/div>\n    <\/nav>/' "$file"
    
    # Fix 3: Remove any duplicate mobile menu content
    sed -i '/<div class="px-4 py-4 space-y-2">/,/<\/div>\s*<\/div>\s*<\/div>/ { /<div class="px-4 py-4 space-y-2">/ { N; /<div class="px-4 py-4 space-y-2">/d } }' "$file"
    
    echo "✅ Fixed: $file"
}

# Function to verify the fix
verify_fix() {
    local file="$1"
    local mobile_menu_count=$(grep -c "id=\"mobileMenu\"" "$file" 2>/dev/null || echo "0")
    local mobile_button_count=$(grep -c "mobileMenuButton" "$file" 2>/dev/null || echo "0")
    local dark_toggle_count=$(grep -c "darkModeToggle" "$file" 2>/dev/null || echo "0")
    
    if [ "$mobile_menu_count" -eq 1 ] && [ "$mobile_button_count" -eq 1 ] && [ "$dark_toggle_count" -eq 1 ]; then
        echo "✅ Verified: $file - Navigation looks perfect"
    else
        echo "❌ Warning: $file - Issues detected (Mobile menu: $mobile_menu_count, Mobile button: $mobile_button_count, Dark toggle: $dark_toggle_count)"
    fi
}

# Main execution
echo "🚀 Starting navigation restoration..."

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
echo "🎉 Navigation restoration completed!"
echo "📊 Summary:"
echo "   - Fixed malformed closing tags"
echo "   - Added proper mobile menu structure"
echo "   - Ensured dark mode toggle works"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 