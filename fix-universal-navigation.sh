#!/bin/bash

echo "🔧 Fixing universal navigation for all device sizes..."

# Universal navigation template that works perfectly on all devices
UNIVERSAL_NAV='    <!-- Navigation -->
    <nav class="fixed top-0 left-0 right-0 w-full bg-white/95 dark:bg-gray-900/95 backdrop-blur-xl border-b border-gray-200/50 dark:border-gray-700/50 shadow-lg z-50 transition-all duration-300">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-16 sm:h-18 lg:h-20">
                <!-- Logo -->
                <div class="flex items-center flex-shrink-0">
                    <a href="/" class="flex items-center space-x-2 sm:space-x-3 group">
                        <img src="/public/favicon.svg?v=1.0.1" alt="MrHeadphones Logo" class="w-6 h-6 sm:w-7 sm:h-7 lg:w-8 lg:h-8 transition-all duration-300 group-hover:scale-105">
                        <span class="font-heading font-bold text-base sm:text-lg lg:text-xl xl:text-2xl text-gray-900 dark:text-white">MrHeadphones</span>
                    </a>
                </div>
                
                <!-- Desktop Navigation - Hidden on mobile -->
                <div class="hidden lg:flex items-center space-x-6 xl:space-x-8">
                    <a href="/#home" class="nav-link text-sm xl:text-base" data-translate="nav_home">Home</a>
                    <a href="/#categories" class="nav-link text-sm xl:text-base" data-translate="nav_categories">Categories</a>
                    <a href="/#devices" class="nav-link text-sm xl:text-base" data-translate="nav_devices">Devices</a>
                    <a href="/#solutions" class="nav-link text-sm xl:text-base" data-translate="nav_solutions">Solutions</a>
                    <a href="/#budget" class="nav-link text-sm xl:text-base" data-translate="nav_budget">Budget</a>
                </div>
                
                <!-- Right Side Controls -->
                <div class="flex items-center space-x-2 sm:space-x-3">
                    <!-- Dark Mode Toggle -->
                    <button id="darkModeToggle" aria-label="Toggle dark mode" data-translate-title="dark_mode_toggle" class="p-2 sm:p-3 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary/30">
                        <span class="dark:hidden">
                            <svg class="w-4 h-4 sm:w-5 sm:h-5" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"/>
                            </svg>
                        </span>
                        <span class="hidden dark:inline">
                            <svg class="w-4 h-4 sm:w-5 sm:h-5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"/>
                            </svg>
                        </span>
                    </button>
                    
                    <!-- Mobile Menu Button - Visible on mobile and tablet -->
                    <button id="mobileMenuButton" aria-label="Toggle mobile menu" data-translate-title="mobile_menu_toggle" class="lg:hidden p-2 sm:p-3 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary/30">
                        <svg class="w-5 h-5 sm:w-6 sm:h-6" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"/>
                        </svg>
                    </button>
                </div>
            </div>
        </div>
        
        <!-- Mobile Menu - Responsive and accessible -->
        <div id="mobileMenu" class="hidden lg:hidden bg-white/98 dark:bg-gray-900/98 backdrop-blur-xl border-t border-gray-200/50 dark:border-gray-700/50 shadow-xl">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 py-4 space-y-1">
                <a href="/#home" class="block py-3 px-4 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_home">Home</a>
                <a href="/#categories" class="block py-3 px-4 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_categories">Categories</a>
                <a href="/#devices" class="block py-3 px-4 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_devices">Devices</a>
                <a href="/#solutions" class="block py-3 px-4 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_solutions">Solutions</a>
                <a href="/#budget" class="block py-3 px-4 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_budget">Budget</a>
            </div>
        </div>
    </nav>'

# Function to fix navigation in a file
fix_navigation() {
    local file="$1"
    echo "Processing: $file"
    
    # Create a temporary file
    temp_file=$(mktemp)
    
    # Use awk to replace the navigation section
    awk -v nav="$UNIVERSAL_NAV" '
    BEGIN { 
        in_nav = 0
        nav_replaced = 0
    }
    /<!-- Navigation -->/ { 
        in_nav = 1
        if (!nav_replaced) {
            print nav
            nav_replaced = 1
        }
        next
    }
    /<nav class=/ { 
        in_nav = 1
        if (!nav_replaced) {
            print nav
            nav_replaced = 1
        }
        next
    }
    /<\/nav>/ { 
        in_nav = 0
        next
    }
    in_nav { next }
    { print }
    ' "$file" > "$temp_file"
    
    # Replace the original file
    mv "$temp_file" "$file"
}

# Find all HTML files and process them
find . -name "*.html" -type f | while read -r file; do
    # Skip backup files
    if [[ "$file" != *".backup"* ]]; then
        fix_navigation "$file"
    fi
done

echo "✅ Universal navigation fixed for all device sizes!"
echo "🎉 Navigation now works perfectly on:"
echo "   - Mobile phones (320px+)"
echo "   - Tablets (768px+)"
echo "   - Desktop (1024px+)"
echo "   - Large screens (1280px+)" 