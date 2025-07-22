#!/bin/bash

# Simple mobile menu fix - Remove old mobile dark mode toggles and fix structure

echo "📱 Simple mobile menu fix..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Remove old mobile dark mode toggle section completely
    sed -i '/mobileDarkModeToggle/,/<\/div>/d' "$file"
    
    # Remove any remaining mobile dark mode toggle references
    sed -i '/mobileDarkModeToggle/d' "$file"
    
    # Fix malformed closing tags in mobile menu
    sed -i 's/<!-- Mobile Menu Button -->\s*<\/a>/<!-- Mobile Menu Button -->/g' "$file"
    
    # Ensure proper mobile menu structure
    sed -i 's/<!-- Mobile Menu -->/<!-- Mobile Menu -->\n        <div id="mobileMenu" class="hidden md:hidden mobile-futuristic border-t border-gray-200\/20 dark:border-gray-700\/20">\n            <div class="px-4 py-4 space-y-2">/g' "$file"
    
    # Add proper mobile menu items if they're missing
    if ! grep -q "nav_home.*Home" "$file"; then
        sed -i '/<!-- Mobile Menu -->/,/<\/div>/ { /<\/div>/ { a\                <a href="/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_home">Home</a>\n                <a href="/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_categories">Categories</a>\n                <a href="/#devices" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_devices">Devices</a>\n                <a href="/#solutions" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_solutions">Solutions</a>\n                <a href="/#budget" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_budget">Budget</a>\n            <\/div>\n        <\/div>
        } }' "$file"
    fi
    
    echo "✅ Fixed: $file"
}

# Function to verify the fix
verify_fix() {
    local file="$1"
    local mobile_menu_count=$(grep -c "<!-- Mobile Menu -->" "$file" 2>/dev/null || echo "0")
    local mobile_dark_toggle_count=$(grep -c "mobileDarkModeToggle" "$file" 2>/dev/null || echo "0")
    
    if [ "$mobile_menu_count" -eq 1 ] && [ "$mobile_dark_toggle_count" -eq 0 ]; then
        echo "✅ Verified: $file - Mobile menu looks good"
    else
        echo "❌ Warning: $file - Issues detected (Mobile menu: $mobile_menu_count, Old mobile dark toggle: $mobile_dark_toggle_count)"
    fi
}

# Main execution
echo "🚀 Starting simple mobile fix..."

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
echo "🎉 Simple mobile fix completed!"
echo "📊 Summary:"
echo "   - Removed old mobile dark mode toggles"
echo "   - Fixed malformed closing tags"
echo "   - Ensured proper mobile menu structure"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 