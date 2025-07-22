#!/bin/bash

# Fix dark mode toggle structure and positioning
# Remove double SVGs and ensure proper positioning next to hamburger menu

echo "🔧 Fixing dark mode toggle structure and positioning..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Remove the broken dark mode toggle structure and replace with correct one
    sed -i '/<!-- Dark Mode Toggle -->/,/<\/button>/c\
                <!-- Dark Mode Toggle -->\
                <button id="darkModeToggle" aria-label="Toggle dark mode" data-translate-title="dark_mode_toggle" class="p-3 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary/30">\
                    <span class="dark:hidden">\
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">\
                            <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"/>\
                        </svg>\
                    </span>\
                    <span class="hidden dark:inline">\
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">\
                            <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"/>\
                        </svg>\
                    </span>\
                </button>' "$file"
    
    # Fix mobile dark mode toggle structure
    sed -i '/<button id="mobileDarkModeToggle"/,/<\/button>/c\
                    <button id="mobileDarkModeToggle" class="futuristic-button w-full text-left py-4 px-6 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:translate-x-3 font-semibold text-gray-800 dark:text-gray-200">\
                        <span class="dark:hidden">Dark Mode</span>\
                        <span class="hidden dark:inline">Light Mode</span>\
                    </button>' "$file"
}

# Update main index.html
echo "📄 Fixing main index.html..."
fix_file "index.html"

# Update all category pages
echo "📁 Fixing category pages..."
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        fix_file "${dir}index.html"
    fi
done

# Update src/pages files if they exist
echo "📁 Fixing src/pages files..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        fix_file "$file"
    fi
done

# Update other HTML files
echo "📄 Fixing other HTML files..."
fix_file "privacy.html"
fix_file "terms.html"

echo "✅ Dark mode toggle structure fixed across all pages!"
echo "🎯 Single SVG icons properly positioned next to hamburger menu"
echo "🔧 Removed double SVGs and fixed positioning" 