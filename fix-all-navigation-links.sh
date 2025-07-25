#!/bin/bash

echo "🔧 Fixing all navigation links throughout the application..."

# Function to fix navigation links in category pages
fix_category_navigation() {
    local file="$1"
    echo "Processing category page: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix desktop navigation - add contact link and ensure proper structure
    sed -i '/<!-- Desktop Navigation - Hidden on mobile -->/,/<!-- Right Side Controls -->/c\
                <!-- Desktop Navigation - Hidden on mobile -->\
                <div class="hidden lg:flex items-center space-x-4 xl:space-x-6 2xl:space-x-8">\
                    <a href="/#home" class="nav-link text-sm xl:text-base" data-translate="nav_home">Home</a>\
                    <a href="/#categories" class="nav-link text-sm xl:text-base" data-translate="nav_categories">Categories</a>\
                    <a href="/#devices" class="nav-link text-sm xl:text-base" data-translate="nav_devices">Devices</a>\
                    <a href="/#solutions" class="nav-link text-sm xl:text-base" data-translate="nav_solutions">Solutions</a>\
                    <a href="/#budget" class="nav-link text-sm xl:text-base" data-translate="nav_budget">Budget</a>\
                    <a href="/#contact" class="nav-link text-sm xl:text-base" data-translate="nav_contact">Contact</a>\
                </div>\
                \
                <!-- Right Side Controls -->' "$file"
    
    # Fix mobile navigation - add contact link
    sed -i '/<!-- Mobile Menu - Responsive and accessible -->/,/<\/div>/c\
        <!-- Mobile Menu - Responsive and accessible -->\
        <div id="mobileMenu" class="hidden lg:hidden bg-white dark:bg-gray-900 backdrop-blur-xl border-t border-gray-200 dark:border-gray-700 shadow-xl">\
            <div class="max-w-7xl mx-auto px-4 sm:px-6 py-4 space-y-1">\
                <a href="/#home" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_home">Home</a>\
                <a href="/#categories" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_categories">Categories</a>\
                <a href="/#devices" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_devices">Devices</a>\
                <a href="/#solutions" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_solutions">Solutions</a>\
                <a href="/#budget" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_budget">Budget</a>\
                <a href="/#contact" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_contact">Contact</a>\
            </div>\
        </div>' "$file"
    
    # Fix footer links to include contact
    sed -i '/<h3 class="font-heading font-semibold text-lg mb-4">Quick Links<\/h3>/,/<\/ul>/c\
                <h3 class="font-heading font-semibold text-lg mb-4">Quick Links</h3>\
                <ul class="space-y-2">\
                    <li><a href="/#home" class="text-gray-300 hover:text-white transition-colors">Home</a></li>\
                    <li><a href="/#categories" class="text-gray-300 hover:text-white transition-colors">Categories</a></li>\
                    <li><a href="/#devices" class="text-gray-300 hover:text-white transition-colors">Devices</a></li>\
                    <li><a href="/#solutions" class="text-gray-300 hover:text-white transition-colors">Solutions</a></li>\
                    <li><a href="/#budget" class="text-gray-300 hover:text-white transition-colors">Budget</a></li>\
                </ul>' "$file"
    
    sed -i '/<h3 class="font-heading font-semibold text-lg mb-4">Connect<\/h3>/,/<\/ul>/c\
                <h3 class="font-heading font-semibold text-lg mb-4">Connect</h3>\
                <ul class="space-y-2">\
                    <li><a href="/#contact" class="text-gray-300 hover:text-white transition-colors">Contact Us</a></li>\
                    <li><a href="mailto:hello@mrheadphones.com" class="text-gray-300 hover:text-white transition-colors">Email</a></li>\
                    <li><a href="/privacy.html" class="text-gray-300 hover:text-white transition-colors">Privacy</a></li>\
                    <li><a href="/terms.html" class="text-gray-300 hover:text-white transition-colors">Terms</a></li>\
                </ul>' "$file"
}

# Function to fix other pages (privacy, terms)
fix_other_pages() {
    local file="$1"
    echo "Processing other page: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix desktop navigation - add contact link
    sed -i '/<!-- Desktop Navigation - Hidden on mobile -->/,/<!-- Right Side Controls -->/c\
                <!-- Desktop Navigation - Hidden on mobile -->\
                <div class="hidden lg:flex items-center space-x-4 xl:space-x-6 2xl:space-x-8">\
                    <a href="/#home" class="nav-link text-sm xl:text-base" data-translate="nav_home">Home</a>\
                    <a href="/#categories" class="nav-link text-sm xl:text-base" data-translate="nav_categories">Categories</a>\
                    <a href="/#devices" class="nav-link text-sm xl:text-base" data-translate="nav_devices">Devices</a>\
                    <a href="/#solutions" class="nav-link text-sm xl:text-base" data-translate="nav_solutions">Solutions</a>\
                    <a href="/#budget" class="nav-link text-sm xl:text-base" data-translate="nav_budget">Budget</a>\
                    <a href="/#contact" class="nav-link text-sm xl:text-base" data-translate="nav_contact">Contact</a>\
                </div>\
                \
                <!-- Right Side Controls -->' "$file"
    
    # Fix mobile navigation - add contact link
    sed -i '/<!-- Mobile Menu - Responsive and accessible -->/,/<\/div>/c\
        <!-- Mobile Menu - Responsive and accessible -->\
        <div id="mobileMenu" class="hidden lg:hidden bg-white dark:bg-gray-900 backdrop-blur-xl border-t border-gray-200 dark:border-gray-700 shadow-xl">\
            <div class="max-w-7xl mx-auto px-4 sm:px-6 py-4 space-y-1">\
                <a href="/#home" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_home">Home</a>\
                <a href="/#categories" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_categories">Categories</a>\
                <a href="/#devices" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_devices">Devices</a>\
                <a href="/#solutions" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_solutions">Solutions</a>\
                <a href="/#budget" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_budget">Budget</a>\
                <a href="/#contact" class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base" data-translate="nav_contact">Contact</a>\
            </div>\
        </div>' "$file"
    
    # Fix footer links to include contact
    sed -i '/<h3 class="font-heading font-semibold text-lg mb-4">Quick Links<\/h3>/,/<\/ul>/c\
                <h3 class="font-heading font-semibold text-lg mb-4">Quick Links</h3>\
                <ul class="space-y-2">\
                    <li><a href="/#home" class="text-gray-300 hover:text-white transition-colors">Home</a></li>\
                    <li><a href="/#categories" class="text-gray-300 hover:text-white transition-colors">Categories</a></li>\
                    <li><a href="/#devices" class="text-gray-300 hover:text-white transition-colors">Devices</a></li>\
                    <li><a href="/#solutions" class="text-gray-300 hover:text-white transition-colors">Solutions</a></li>\
                    <li><a href="/#budget" class="text-gray-300 hover:text-white transition-colors">Budget</a></li>\
                </ul>' "$file"
    
    sed -i '/<h3 class="font-heading font-semibold text-lg mb-4">Connect<\/h3>/,/<\/ul>/c\
                <h3 class="font-heading font-semibold text-lg mb-4">Connect</h3>\
                <ul class="space-y-2">\
                    <li><a href="/#contact" class="text-gray-300 hover:text-white transition-colors">Contact Us</a></li>\
                    <li><a href="mailto:hello@mrheadphones.com" class="text-gray-300 hover:text-white transition-colors">Email</a></li>\
                    <li><a href="/privacy.html" class="text-gray-300 hover:text-white transition-colors">Privacy</a></li>\
                    <li><a href="/terms.html" class="text-gray-300 hover:text-white transition-colors">Terms</a></li>\
                </ul>' "$file"
}

# Fix category pages navigation
echo "Fixing category pages navigation..."
find categories -name "index.html" | while read -r file; do
    fix_category_navigation "$file"
done

# Fix src/pages category files
echo "Fixing src/pages category files..."
find src/pages/categories -name "*.html" | while read -r file; do
    fix_category_navigation "$file"
done

# Fix other pages (privacy, terms)
echo "Fixing other pages..."
fix_other_pages "privacy.html"
fix_other_pages "terms.html"

echo "✅ All navigation links fixed throughout the application!" 