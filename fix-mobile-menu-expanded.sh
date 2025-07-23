#!/bin/bash

echo "🔧 Fixing mobile menu expanded issue and double menus..."

# Function to fix a single HTML file
fix_mobile_menu() {
    local file="$1"
    
    if [ ! -f "$file" ]; then
        return
    fi
    
    echo "Fixing: $file"
    
    # Create backup
    cp "$file" "$file.backup"
    
    # Remove reference to non-existent languages.js
    sed -i 's|<script src="/src/js/languages.js"></script>||g' "$file"
    
    # Ensure mobile menu starts hidden by checking the class
    sed -i 's|<div id="mobileMenu" class="lg:hidden|<div id="mobileMenu" class="hidden lg:hidden|g' "$file"
    
    # Remove any duplicate mobile menu sections (keep only the first one)
    # This is a more complex operation - we'll use awk to handle it
    awk '
    BEGIN { in_mobile_menu = 0; mobile_menu_count = 0; skip_until_close = 0; }
    /<!-- Mobile Menu - Responsive and accessible -->/ {
        if (mobile_menu_count > 0) {
            skip_until_close = 1;
        } else {
            mobile_menu_count++;
            in_mobile_menu = 1;
            print;
        }
        next;
    }
    /<\/div>/ {
        if (in_mobile_menu) {
            in_mobile_menu = 0;
            print;
            next;
        }
    }
    {
        if (!skip_until_close) {
            print;
        }
    }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    
    echo "✅ Fixed: $file"
}

# Fix all category pages
echo "📁 Fixing category pages..."
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        fix_mobile_menu "$dir/index.html"
    fi
done

# Fix src/pages category pages
echo "📁 Fixing src/pages category pages..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        fix_mobile_menu "$file"
    fi
done

# Fix main pages
echo "📄 Fixing main pages..."
fix_mobile_menu "index.html"
fix_mobile_menu "privacy.html"
fix_mobile_menu "terms.html"

echo "🎉 Mobile menu fix completed!"
echo "✅ Removed non-existent languages.js references"
echo "✅ Ensured mobile menu starts hidden"
echo "✅ Removed duplicate mobile menu sections"
echo ""
echo "📝 Changes made:"
echo "- Removed references to /src/js/languages.js"
echo "- Ensured mobile menu has 'hidden' class initially"
echo "- Removed any duplicate mobile menu sections"
echo ""
echo "🔄 Please test the mobile menu on category pages now." 