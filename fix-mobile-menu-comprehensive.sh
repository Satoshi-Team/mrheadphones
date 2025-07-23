#!/bin/bash

echo "🔧 Fixing mobile menu issues across all category pages..."

# Function to fix a single category page
fix_category_page() {
    local file="$1"
    echo "Fixing: $file"
    
    # Create a backup
    cp "$file" "${file}.backup"
    
    # Fix the mobile menu structure
    sed -i '/<!-- Mobile Menu -->/,/<\/div>/d' "$file"
    
    # Remove any duplicate mobile menu elements that might be outside the nav
    sed -i '/<div id="mobileMenu"/,/<\/div>/d' "$file"
    
    # Remove broken closing tags and duplicate elements
    sed -i '/^\s*<\/div>\s*$/d' "$file"
    sed -i '/^\s*<\/a>\s*$/d' "$file"
    
    # Remove duplicate navigation links that are outside the nav structure
    sed -i '/<a href="\/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_home">Home<\/a>/d' "$file"
    sed -i '/<a href="\/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_categories">Categories<\/a>/d' "$file"
    sed -i '/<a href="\/#devices" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_devices">Devices<\/a>/d' "$file"
    sed -i '/<a href="\/#solutions" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_solutions">Solutions<\/a>/d' "$file"
    sed -i '/<a href="\/#budget" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_budget">Budget<\/a>/d' "$file"
    
    # Find the nav closing tag and insert proper mobile menu before it
    sed -i 's|</div>\s*</div>\s*</nav>|        </div>\n        \n        <!-- Mobile Menu -->\n        <div id="mobileMenu" class="hidden md:hidden mobile-futuristic border-t border-gray-200/20 dark:border-gray-700/20">\n            <div class="px-4 py-4 space-y-2">\n                <a href="/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_home">Home</a>\n                <a href="/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_categories">Categories</a>\n                <a href="/#devices" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_devices">Devices</a>\n                <a href="/#solutions" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_solutions">Solutions</a>\n                <a href="/#budget" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_budget">Budget</a>\n            </div>\n        </div>\n    </nav>|' "$file"
    
    # Clean up any remaining duplicate elements
    sed -i '/^\s*<div class="px-4 py-4 space-y-2">\s*$/d' "$file"
    sed -i '/^\s*<\/div>\s*$/d' "$file"
    
    # Fix any remaining structural issues
    sed -i 's|</div>\s*</div>\s*</div>\s*</div>|        </div>\n    </nav>|' "$file"
    
    echo "✅ Fixed: $file"
}

# Fix all category pages
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        fix_category_page "${dir}index.html"
    fi
done

# Also fix any pages in src/pages/categories/
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        fix_category_page "$file"
    fi
done

echo "🎉 Mobile menu fixes completed!"
echo "📝 Backups created with .backup extension"
echo "🔍 Please test the mobile menu functionality on category pages" 