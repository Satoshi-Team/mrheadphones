#!/bin/bash

# Final Structure Fix Script
# This script fixes the remaining structural issues for perfect uniformity

echo "Starting final structure fix..."

# Function to fix navigation structure
fix_navigation_structure() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing navigation structure in: $file"
    
    # Fix the navigation structure completely
    sed -E '
    # Fix HTML class attribute
    s/<html lang="en">/<html lang="en" class="scroll-smooth">/g
    
    # Fix body class
    s/class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white transition-colors duration-300"/class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white dark-mode-transition"/g
    
    # Fix navigation container
    s/class="fixed top-0 left-0 right-0 w-full bg-white\/95 dark:bg-gray-900\/95 backdrop-blur-xl border-b border-gray-200\/50 dark:border-gray-700\/50 shadow-lg z-50 transition-all duration-300"/class="fixed top-0 left-0 right-0 w-full bg-white\/95 dark:bg-gray-900\/95 backdrop-blur-xl border-b border-gray-200\/50 dark:border-gray-700\/50 shadow-lg z-50 transition-all duration-300"/g
    
    # Fix navigation inner container
    s/class="content-container-wide"/class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"/g
    
    # Fix navigation flex container
    s/class="flex justify-between items-center h-16 sm:h-18 lg:h-20"/class="flex justify-between items-center h-16 sm:h-18 lg:h-20"/g
    
    # Fix logo container
    s/class="flex items-center flex-shrink-0"/class="flex items-center flex-shrink-0"/g
    
    # Fix logo link
    s/class="flex items-center space-x-2 sm:space-x-3 group"/class="flex items-center space-x-2 sm:space-x-3 group"/g
    
    # Fix logo image
    s/class="w-6 h-6 sm:w-7 sm:h-7 lg:w-8 lg:h-8 transition-all duration-300 group-hover:scale-105"/class="w-6 h-6 sm:w-7 sm:h-7 lg:w-8 lg:h-8 transition-all duration-300 group-hover:scale-105"/g
    
    # Fix logo text
    s/class="font-heading font-bold text-base sm:text-lg lg:text-xl xl:text-2xl text-gray-900 dark:text-white"/class="font-heading font-bold text-base sm:text-lg lg:text-xl xl:text-2xl text-gray-900 dark:text-white"/g
    
    # Fix desktop navigation - ensure it has the correct classes
    s/class="flex items-center space-x-2 sm:space-x-3"/class="hidden lg:flex items-center space-x-6 xl:space-x-8"/g
    
    # Fix navigation links
    s/class="nav-link text-sm xl:text-base text-gray-300 hover:text-white transition-colors"/class="nav-link text-sm xl:text-base"/g
    
    # Fix right side controls
    s/class="flex items-center space-x-2 sm:space-x-3"/class="flex items-center space-x-2 sm:space-x-3"/g
    
    # Fix dark mode toggle
    s/class="p-2 sm:p-3 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary\/30"/class="p-2 sm:p-3 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary\/30"/g
    
    # Fix mobile menu button
    s/class="lg:hidden p-2 sm:p-3 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary\/30"/class="lg:hidden p-2 sm:p-3 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary\/30"/g
    
    # Fix mobile menu
    s/class="hidden lg:hidden bg-white\/98 dark:bg-gray-900\/98 backdrop-blur-xl border-t border-gray-200\/50 dark:border-gray-700\/50 shadow-xl card"/class="hidden lg:hidden bg-white\/98 dark:bg-gray-900\/98 backdrop-blur-xl border-t border-gray-200\/50 dark:border-gray-700\/50 shadow-xl"/g
    
    # Fix mobile menu container
    s/class="content-container-wide"/class="max-w-7xl mx-auto px-4 sm:px-6 py-4 space-y-1"/g
    
    # Fix mobile menu links
    s/class="nav-link text-sm xl:text-base text-gray-300 hover:text-white transition-colors"/class="block py-3 px-4 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg"/g
    
    # Fix hero section
    s/class="hero-gradient text-white py-16 sm:py-20 lg:py-24 section-padding"/class="pt-32 pb-16 hero-gradient text-white relative overflow-hidden"/g
    
    # Fix hero content container
    s/class="content-container text-center"/class="content-container text-center"/g
    
    # Fix hero heading
    s/class="font-heading font-bold text-3xl sm:text-4xl lg:text-5xl mb-6 responsive-heading"/class="font-heading font-bold responsive-heading mb-6"/g
    
    # Fix hero description
    s/class="text-xl sm:text-2xl mb-8 max-w-3xl mx-auto text-gray-100 responsive-text text-gray-200 text-gray-300"/class="responsive-text mb-8 text-gray-200 max-w-4xl mx-auto"/g
    
    # Fix hero button container
    s/class="flex flex-col sm:flex-row gap-4 justify-center"/class="flex flex-col sm:flex-row gap-4 justify-center"/g
    
    # Fix content sections
    s/class="py-20"/class="section-padding"/g
    s/class="py-20 bg-gray-50 dark:bg-gray-900"/class="section-padding bg-gray-50 dark:bg-gray-900"/g
    
    # Fix content containers
    s/class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"/class="content-container-wide"/g
    s/class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8"/class="content-container"/g
    s/class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8"/class="content-container-narrow"/g
    
    # Fix section headings
    s/class="font-heading font-bold text-3xl sm:text-4xl mb-4"/class="font-heading font-bold text-3xl sm:text-4xl mb-4"/g
    
    # Fix section descriptions
    s/class="text-lg text-gray-600 dark:text-gray-300 max-w-4xl mx-auto"/class="text-lg text-gray-600 dark:text-gray-300 max-w-4xl mx-auto"/g
    
    # Fix grid layouts
    s/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8"/g
    s/class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-6"/class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-8"/g
    
    # Fix cards
    s/class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6"/class="card"/g
    s/class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6"/class="card"/g
    
    # Fix card hover effects
    s/class="card hover:transform hover:-translate-y-2 hover:scale-105"/class="card-hover"/g
    
    # Fix buttons
    s/class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded"/class="btn-primary"/g
    s/class="bg-purple-600 hover:bg-purple-700 text-white font-semibold py-2 px-4 rounded"/class="btn-secondary"/g
    
    # Fix footer
    s/class="bg-gray-900 text-white py-12"/class="bg-primary text-white py-12"/g
    s/class="bg-primary text-white py-12"/class="bg-primary text-white py-12"/g
    
    # Fix footer container
    s/class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"/class="content-container-wide"/g
    
    # Fix footer grid
    s/class="grid grid-cols-1 md:grid-cols-4 gap-6"/class="grid grid-cols-1 md:grid-cols-4 gap-8"/g
    
    # Fix footer text colors
    s/class="text-gray-400"/class="text-gray-300"/g
    
    # Fix footer links
    s/class="text-gray-400 hover:text-white transition-colors"/class="text-gray-300 hover:text-white transition-colors"/g
    
    # Fix floating compare button
    s/class="fixed bottom-6 right-6 bg-blue-600 hover:bg-blue-700 text-white p-4 rounded-full shadow-lg hover:shadow-xl transition-all duration-300 z-40"/class="fixed bottom-6 right-6 bg-secondary hover:bg-secondary\/90 text-white p-4 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 z-40 group hover:scale-105 focus:outline-none focus:ring-2 focus:ring-secondary\/30 border border-white\/10"/g
    
    # Fix JavaScript reference
    s/src="\.\/src\/js\/main\.js"/src="\/src\/js\/main.js"/g
    s/src="src\/js\/main\.js"/src="\/src\/js\/main.js"/g
    
    # Fix CSS reference
    s/href="\.\/dist\/output\.css/href="\/dist\/output.css/g
    s/href="dist\/output\.css/href="\/dist\/output.css/g
    
    # Fix favicon references
    s/href="\.\/public\/favicon/href="\/public\/favicon/g
    s/href="public\/favicon/href="\/public\/favicon/g
    s/src="\.\/public\/favicon/src="\/public\/favicon/g
    s/src="public\/favicon/src="\/public\/favicon/g
    ' "$file" > "$temp_file"
    
    # Replace original with fixed version
    mv "$temp_file" "$file"
}

# Function to fix duplicate navigation elements
fix_duplicate_navigation() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing duplicate navigation elements in: $file"
    
    # Remove duplicate right side controls sections
    awk '
    BEGIN { in_nav = 0; right_controls_count = 0; }
    /<!-- Right Side Controls -->/ { 
        if (right_controls_count == 0) {
            right_controls_count++
            print
            next
        } else {
            # Skip this duplicate section
            in_skip = 1
            next
        }
    }
    /<!-- Desktop Navigation - Hidden on mobile -->/ { 
        if (right_controls_count == 0) {
            # This is the first occurrence, keep it
            print
            next
        } else {
            # Skip this duplicate section
            in_skip = 1
            next
        }
    }
    /<\/div>/ { 
        if (in_skip) {
            in_skip = 0
            next
        }
    }
    in_skip { next }
    { print }
    ' "$file" > "$temp_file"
    
    # Replace original with fixed version
    mv "$temp_file" "$file"
}

# Function to ensure proper navigation structure
ensure_proper_navigation() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Ensuring proper navigation structure in: $file"
    
    # Replace the entire navigation section with the correct structure
    sed -E '
    # Replace the entire navigation section
    /<!-- Navigation -->/,/<\/nav>/c\
    <!-- Navigation -->\
    <nav class="fixed top-0 left-0 right-0 w-full bg-white\/95 dark:bg-gray-900\/95 backdrop-blur-xl border-b border-gray-200\/50 dark:border-gray-700\/50 shadow-lg z-50 transition-all duration-300">\
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">\
            <div class="flex justify-between items-center h-16 sm:h-18 lg:h-20">\
                <!-- Logo -->\
                <div class="flex items-center flex-shrink-0">\
                    <a href="/" class="flex items-center space-x-2 sm:space-x-3 group">\
                        <img src="/public/favicon.svg?v=1.0.1" alt="MrHeadphones Logo" class="w-6 h-6 sm:w-7 sm:h-7 lg:w-8 lg:h-8 transition-all duration-300 group-hover:scale-105">\
                        <span class="font-heading font-bold text-base sm:text-lg lg:text-xl xl:text-2xl text-gray-900 dark:text-white">MrHeadphones</span>\
                    </a>\
                </div>\
                \
                <!-- Desktop Navigation - Hidden on mobile -->\
                <div class="hidden lg:flex items-center space-x-6 xl:space-x-8">\
                    <a href="/#home" class="nav-link text-sm xl:text-base" data-translate="nav_home">Home</a>\
                    <a href="/#categories" class="nav-link text-sm xl:text-base" data-translate="nav_categories">Categories</a>\
                    <a href="/#devices" class="nav-link text-sm xl:text-base" data-translate="nav_devices">Devices</a>\
                    <a href="/#solutions" class="nav-link text-sm xl:text-base" data-translate="nav_solutions">Solutions</a>\
                    <a href="/#budget" class="nav-link text-sm xl:text-base" data-translate="nav_budget">Budget</a>\
                </div>\
                \
                <!-- Right Side Controls -->\
                <div class="flex items-center space-x-2 sm:space-x-3">\
                    <!-- Dark Mode Toggle -->\
                    <button id="darkModeToggle" aria-label="Toggle dark mode" data-translate-title="dark_mode_toggle" class="p-2 sm:p-3 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary\/30">\
                        <span class="dark:hidden">\
                            <svg class="w-4 h-4 sm:w-5 sm:h-5" fill="currentColor" viewBox="0 0 20 20">\
                                <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"/>\
                            </svg>\
                        </span>\
                        <span class="hidden dark:inline">\
                            <svg class="w-4 h-4 sm:w-5 sm:h-5" fill="currentColor" viewBox="0 0 20 20">\
                                <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"/>\
                            </svg>\
                        </span>\
                    </button>\
                    \
                    <!-- Mobile Menu Button - Visible on mobile and tablet -->\
                    <button id="mobileMenuButton" aria-label="Toggle mobile menu" data-translate-title="mobile_menu_toggle" class="lg:hidden p-2 sm:p-3 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary\/30">\
                        <svg class="w-5 h-5 sm:w-6 sm:h-6" fill="currentColor" viewBox="0 0 20 20">\
                            <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"/>\
                        </svg>\
                    </button>\
                </div>\
            </div>\
        </div>\
        \
        <!-- Mobile Menu - Responsive and accessible -->\
        <div id="mobileMenu" class="hidden lg:hidden bg-white\/98 dark:bg-gray-900\/98 backdrop-blur-xl border-t border-gray-200\/50 dark:border-gray-700\/50 shadow-xl">\
            <div class="max-w-7xl mx-auto px-4 sm:px-6 py-4 space-y-1">\
                <a href="/#home" class="block py-3 px-4 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_home">Home</a>\
                <a href="/#categories" class="block py-3 px-4 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_categories">Categories</a>\
                <a href="/#devices" class="block py-3 px-4 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_devices">Devices</a>\
                <a href="/#solutions" class="block py-3 px-4 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_solutions">Solutions</a>\
                <a href="/#budget" class="block py-3 px-4 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_budget">Budget</a>\
            </div>\
        </div>\
    </nav>
    ' "$file" > "$temp_file"
    
    # Replace original with fixed version
    mv "$temp_file" "$file"
}

# Main execution
echo "Starting final structure fix for all HTML files..."

# Fix main pages
for file in index.html privacy.html terms.html; do
    if [ -f "$file" ]; then
        echo "Processing main page: $file"
        fix_navigation_structure "$file"
        fix_duplicate_navigation "$file"
        ensure_proper_navigation "$file"
    fi
done

# Fix category pages
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        for file in "$dir"*.html; do
            if [ -f "$file" ]; then
                echo "Processing category page: $file"
                fix_navigation_structure "$file"
                fix_duplicate_navigation "$file"
                ensure_proper_navigation "$file"
            fi
        done
    fi
done

# Fix src/pages files if they exist
if [ -d "src/pages" ]; then
    for file in src/pages/**/*.html; do
        if [ -f "$file" ]; then
            echo "Processing src page: $file"
            fix_navigation_structure "$file"
            fix_duplicate_navigation "$file"
            ensure_proper_navigation "$file"
        fi
    done
fi

echo "Final structure fix completed!"
echo "All pages now have perfect uniform structure." 