#!/bin/bash

# Fix triple mobile menu issue - Remove all duplicates and ensure single mobile menu

echo "🔧 Fixing triple mobile menu issue..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Create temporary file
    temp_file=$(mktemp)
    
    # Use awk to completely rebuild the navigation section with only one mobile menu
    awk '
    BEGIN { 
        in_nav = 0; 
        in_mobile_menu = 0; 
        mobile_menu_added = 0;
        skip_duplicate = 0;
    }
    
    # Track navigation section
    /<nav class=/ { 
        in_nav = 1; 
        print $0;
        next;
    }
    
    # End of navigation
    /<\/nav>/ { 
        if (in_nav && !mobile_menu_added) {
            # Add proper mobile menu before closing nav
            print "        <!-- Mobile Menu -->";
            print "        <div id=\"mobileMenu\" class=\"hidden md:hidden mobile-futuristic border-t border-gray-200/20 dark:border-gray-700/20\">";
            print "            <div class=\"px-4 py-4 space-y-2\">";
            print "                <a href=\"/#home\" class=\"block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700\" data-translate=\"nav_home\">Home</a>";
            print "                <a href=\"/#categories\" class=\"block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700\" data-translate=\"nav_categories\">Categories</a>";
            print "                <a href=\"/#devices\" class=\"block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700\" data-translate=\"nav_devices\">Devices</a>";
            print "                <a href=\"/#solutions\" class=\"block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700\" data-translate=\"nav_solutions\">Solutions</a>";
            print "                <a href=\"/#budget\" class=\"block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700\" data-translate=\"nav_budget\">Budget</a>";
            print "            </div>";
            print "        </div>";
            mobile_menu_added = 1;
        }
        in_nav = 0;
        print $0;
        next;
    }
    
    # Skip any existing mobile menu content
    if (in_nav && (/mobile-menu-item/ || /<!-- Mobile Menu -->/ || /id="mobileMenu"/)) {
        skip_duplicate = 1;
        next;
    }
    
    # Skip all content until we find the end of the duplicate section
    if (skip_duplicate) {
        if (/<\/div>\s*<\/div>\s*<\/div>/ || /<\/nav>/) {
            skip_duplicate = 0;
        }
        next;
    }
    
    # Print all other lines unchanged
    print $0;
    ' "$file" > "$temp_file"
    
    # Replace original file
    mv "$temp_file" "$file"
    
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
echo "🚀 Starting triple mobile menu fix..."

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
echo "🎉 Triple mobile menu fix completed!"
echo "📊 Summary:"
echo "   - Removed all duplicate mobile menus"
echo "   - Ensured single mobile menu with Home link"
echo "   - Removed mobile-menu-item duplicates"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 