#!/bin/bash

echo "🔧 Restoring pages from backups and applying careful navigation fix..."

# Function to restore and fix a single page
restore_and_fix_page() {
    local file="$1"
    local backup_file="${file}.backup"
    
    if [ -f "$backup_file" ]; then
        echo "Restoring: $file from backup"
        cp "$backup_file" "$file"
        
        # Now apply a careful navigation fix - only replace the navigation section
        # First, find the navigation section and remove it
        sed -i '/<nav class="fixed top-0/,/<\/nav>/d' "$file"
        
        # Insert the correct navigation before the hero section
        sed -i '/<!-- Hero Section -->/i\
    <!-- Navigation -->\
    <nav class="fixed top-0 w-full glass-effect z-50 border-b border-gray-200/30 dark:border-gray-700/30 backdrop-blur-2xl shadow-lg">\
        <div class="content-container-wide">\
            <div class="flex justify-between items-center h-16">\
                <!-- Logo -->\
                <div class="flex items-center">\
                    <a href="/" class="flex items-center space-x-3 group">\
                        <img src="/public/favicon.svg?v=1.0.1" alt="MrHeadphones Logo" class="w-6 h-6 sm:w-7 sm:h-7 lg:w-8 lg:h-8 transition-all duration-300 group-hover:scale-105">\
                        <span class="font-heading font-bold text-lg sm:text-xl lg:text-2xl text-gray-900 dark:text-white">MrHeadphones</span>\
                    </a>\
                </div>\
                \
                <!-- Desktop Navigation -->\
                <div class="hidden md:flex items-center space-x-8">\
                    <a href="/#home" class="nav-link" data-translate="nav_home">Home</a>\
                    <a href="/#categories" class="nav-link" data-translate="nav_categories">Categories</a>\
                    <a href="/#devices" class="nav-link" data-translate="nav_devices">Devices</a>\
                    <a href="/#solutions" class="nav-link" data-translate="nav_solutions">Solutions</a>\
                    <a href="/#budget" class="nav-link" data-translate="nav_budget">Budget</a>\
                </div>\
                \
                <!-- Right Side Controls -->\
                <div class="flex items-center space-x-2">\
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
                    </button>\
                    \
                    <!-- Mobile Menu Button -->\
                    <button id="mobileMenuButton" aria-label="Toggle mobile menu" data-translate-title="mobile_menu_toggle" class="md:hidden p-3 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary/30">\
                        <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">\
                            <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"/>\
                        </svg>\
                    </button>\
                </div>\
            </div>\
        </div>\
        \
        <!-- Mobile Menu -->\
        <div id="mobileMenu" class="hidden md:hidden mobile-futuristic border-t border-gray-200/20 dark:border-gray-700/20">\
            <div class="px-4 py-4 space-y-2">\
                <a href="/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_home">Home</a>\
                <a href="/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_categories">Categories</a>\
                <a href="/#devices" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_devices">Devices</a>\
                <a href="/#solutions" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_solutions">Solutions</a>\
                <a href="/#budget" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_budget">Budget</a>\
            </div>\
        </div>\
    </nav>\
' "$file"
        
        echo "✅ Fixed: $file"
    else
        echo "❌ No backup found for: $file"
    fi
}

# Restore and fix all category pages
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        restore_and_fix_page "${dir}index.html"
    fi
done

echo "🎉 Pages restored and navigation fixed!" 