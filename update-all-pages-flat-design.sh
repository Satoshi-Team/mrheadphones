#!/bin/bash

# Update all category pages with the new flat design for 2025
# This script removes emojis and ensures uniform design across all pages

echo "🔄 Updating all category pages with flat design for 2025..."

# Function to update a single file
update_file() {
    local file="$1"
    echo "📝 Updating: $file"
    
    # Update navigation bar with new flat design
    sed -i 's|<nav class="fixed top-0 w-full glass-effect z-50 border-b border-gray-200 dark:border-gray-700">|<nav class="fixed top-0 w-full glass-effect z-50 border-b border-gray-200/30 dark:border-gray-700/30 backdrop-blur-2xl shadow-lg">|g' "$file"
    
    # Update logo section
    sed -i 's|<a href="/" class="flex items-center space-x-2">|<a href="/" class="flex items-center space-x-3 group">|g' "$file"
    sed -i 's|<img src=".*favicon.svg.*" alt="MrHeadphones Logo" class="w-5 h-5 sm:w-6 sm:h-6 lg:w-7 lg:h-7">|<img src="../../../public/favicon.svg?v=1.0.1" alt="MrHeadphones Logo" class="w-6 h-6 sm:w-7 sm:h-7 lg:w-8 lg:h-8 transition-all duration-300 group-hover:scale-105">|g' "$file"
    sed -i 's|<span class="font-heading font-bold text-base sm:text-lg text-secondary">MrHeadphones</span>|<span class="font-heading font-bold text-lg sm:text-xl lg:text-2xl text-gray-900 dark:text-white">MrHeadphones</span>|g' "$file"
    
    # Remove emojis from desktop navigation
    sed -i 's|<a href="/#home" class="nav-link">🎧 Home</a>|<a href="/#home" class="nav-link">Home</a>|g' "$file"
    sed -i 's|<a href="/#categories" class="nav-link">🔍 Categories</a>|<a href="/#categories" class="nav-link">Categories</a>|g' "$file"
    sed -i 's|<a href="/#devices" class="nav-link">📱 Devices</a>|<a href="/#devices" class="nav-link">Devices</a>|g' "$file"
    sed -i 's|<a href="/#solutions" class="nav-link">🧠 Solutions</a>|<a href="/#solutions" class="nav-link">Solutions</a>|g' "$file"
    sed -i 's|<a href="/#budget" class="nav-link">💰 Budget</a>|<a href="/#budget" class="nav-link">Budget</a>|g' "$file"
    
    # Update dark mode toggle (remove emojis and update styling)
    sed -i 's|<button id="darkModeToggle".*class="p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 focus-visible">|<button id="darkModeToggle" aria-label="Toggle dark mode" data-translate-title="dark_mode_toggle" class="p-3 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary/30">|g' "$file"
    sed -i 's|<span class="dark:hidden">🌙</span>|<span class="dark:hidden">|g' "$file"
    sed -i 's|<span class="hidden dark:inline">☀️</span>|<span class="hidden dark:inline">|g' "$file"
    
    # Add SVG icons for dark mode toggle
    sed -i '/<span class="dark:hidden">/a\                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">\n                            <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"/>\n                        </svg>' "$file"
    sed -i '/<span class="hidden dark:inline">/a\                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">\n                            <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"/>\n                        </svg>' "$file"
    
    # Update mobile menu button
    sed -i 's|<button id="mobileMenuButton".*class="md:hidden p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 focus-visible">|<button id="mobileMenuButton" aria-label="Toggle mobile menu" data-translate-title="mobile_menu_toggle" class="md:hidden p-3 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary/30">|g' "$file"
    sed -i 's|<span class="text-xl">☰</span>|<svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">\n                        <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"/>\n                    </svg>|g' "$file"
    
    # Update mobile menu with new flat design
    sed -i 's|<div id="mobileMenu" class="hidden md:hidden bg-white dark:bg-gray-900 border-t border-gray-200 dark:border-gray-700 mobile-menu">|<div id="mobileMenu" class="hidden md:hidden mobile-futuristic border-t border-gray-200/20 dark:border-gray-700/20">|g' "$file"
    sed -i 's|<div class="px-4 py-2 space-y-2">|<div class="px-4 py-4 space-y-2">|g' "$file"
    
    # Remove emojis from mobile menu items and update styling
    sed -i 's|<a href="/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">🎧 Home</a>|<a href="/#home" class="mobile-menu-item block py-4 px-6 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:translate-x-3 font-semibold text-gray-800 dark:text-gray-200">Home</a>|g' "$file"
    sed -i 's|<a href="/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">🔍 Categories</a>|<a href="/#categories" class="mobile-menu-item block py-4 px-6 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:translate-x-3 font-semibold text-gray-800 dark:text-gray-200">Categories</a>|g' "$file"
    sed -i 's|<a href="/#devices" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">📱 Devices</a>|<a href="/#devices" class="mobile-menu-item block py-4 px-6 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:translate-x-3 font-semibold text-gray-800 dark:text-gray-200">Devices</a>|g' "$file"
    sed -i 's|<a href="/#solutions" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">🧠 Solutions</a>|<a href="/#solutions" class="mobile-menu-item block py-4 px-6 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:translate-x-3 font-semibold text-gray-800 dark:text-gray-200">Solutions</a>|g' "$file"
    sed -i 's|<a href="/#budget" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">💰 Budget</a>|<a href="/#budget" class="mobile-menu-item block py-4 px-6 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:translate-x-3 font-semibold text-gray-800 dark:text-gray-200">Budget</a>|g' "$file"
    
    # Add mobile dark mode toggle
    sed -i '/<a href="\/#budget" class="mobile-menu-item block py-4 px-6 rounded-2xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 transition-all duration-300 hover:translate-x-3 font-semibold text-gray-800 dark:text-gray-200">Budget<\/a>/a\                <div class="pt-3 border-t border-gray-200/30 dark:border-gray-700/30">\n                    <button id="mobileDarkModeToggle" class="futuristic-button w-full text-left py-4 px-6 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:translate-x-3 font-semibold text-gray-800 dark:text-gray-200">\n                        <span class="dark:hidden">Dark Mode</span>\n                        <span class="hidden dark:inline">Light Mode</span>\n                    </button>\n                </div>' "$file"
    
    # Update floating compare button if it exists
    sed -i 's|<button class="fixed bottom-6 right-6 bg-secondary hover:bg-secondary/90 text-white p-3 rounded-full shadow-lg hover:shadow-xl transition-all duration-200 z-40">|<a href="#compare" class="fixed bottom-6 right-6 bg-secondary hover:bg-secondary/90 text-white p-4 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 z-40 group hover:scale-105 focus:outline-none focus:ring-2 focus:ring-secondary/30 border border-white/10">|g' "$file"
    sed -i 's|<svg class="w-4 h-4 inline" fill="currentColor" viewBox="0 0 24 24">|<svg class="w-4 h-4 inline transition-transform duration-300 group-hover:translate-x-0.5" fill="currentColor" viewBox="0 0 24 24">|g' "$file"
    sed -i 's|</button>|</a>|g' "$file"
}

# Update main index.html
echo "📄 Updating main index.html..."
update_file "index.html"

# Update all category pages
echo "📁 Updating category pages..."
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        update_file "${dir}index.html"
    fi
done

# Update src/pages files if they exist
echo "📁 Updating src/pages files..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        update_file "$file"
    fi
done

# Update other HTML files
echo "📄 Updating other HTML files..."
update_file "privacy.html"
update_file "terms.html"

echo "✅ All pages updated with flat design for 2025!"
echo "🎨 Emojis removed and uniform design applied across all pages"
echo "📱 Mobile navigation now consistent with beautiful flat design" 