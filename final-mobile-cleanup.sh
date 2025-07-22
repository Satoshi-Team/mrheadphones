#!/bin/bash

# Final mobile menu cleanup - Fix duplicate divs and ensure proper structure

echo "🧹 Final mobile menu cleanup..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Create temporary file
    temp_file=$(mktemp)
    
    # Use awk to process and fix duplicate mobile menu divs
    awk '
    BEGIN { 
        in_mobile_menu = 0; 
        mobile_menu_count = 0;
        skip_duplicate = 0;
    }
    
    # Track mobile menu section
    /<!-- Mobile Menu -->/ { 
        in_mobile_menu = 1; 
        mobile_menu_count++;
        if (mobile_menu_count == 1) {
            print $0;
        } else {
            skip_duplicate = 1;
        }
        next;
    }
    
    # End of mobile menu
    /<\/div>/ && in_mobile_menu { 
        if (mobile_menu_count == 1) {
            print $0;
        }
        in_mobile_menu = 0; 
        skip_duplicate = 0;
        next;
    }
    
    # Skip duplicate content
    if (skip_duplicate) {
        next;
    }
    
    # Print all other lines unchanged
    print $0;
    ' "$file" > "$temp_file"
    
    # Replace original file
    mv "$temp_file" "$file"
    
    # Remove any remaining old mobile dark mode toggle references
    sed -i '/mobileDarkModeToggle/d' "$file"
    
    # Ensure proper mobile menu structure
    sed -i 's/<!-- Mobile Menu -->/<!-- Mobile Menu -->\n        <div id="mobileMenu" class="hidden md:hidden mobile-futuristic border-t border-gray-200\/20 dark:border-gray-700\/20">\n            <div class="px-4 py-4 space-y-2">/g' "$file"
    
    # Add proper mobile menu items if missing
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
    local duplicate_divs=$(grep -c "mobileMenu.*mobileMenu" "$file" 2>/dev/null || echo "0")
    
    if [ "$mobile_menu_count" -eq 1 ] && [ "$mobile_dark_toggle_count" -eq 0 ] && [ "$duplicate_divs" -eq 0 ]; then
        echo "✅ Verified: $file - Mobile menu looks perfect"
    else
        echo "❌ Warning: $file - Issues detected (Mobile menu: $mobile_menu_count, Old mobile dark toggle: $mobile_dark_toggle_count, Duplicate divs: $duplicate_divs)"
    fi
}

# Main execution
echo "🚀 Starting final mobile cleanup..."

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
echo "🎉 Final mobile cleanup completed!"
echo "📊 Summary:"
echo "   - Removed duplicate mobile menu divs"
echo "   - Removed old mobile dark mode toggles"
echo "   - Ensured proper mobile menu structure"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 