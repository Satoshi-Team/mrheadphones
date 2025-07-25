#!/bin/bash

# Comprehensive Universal Fix for All Pages
# This script will standardize all pages with uniform layout and styling

echo "Starting comprehensive universal fix for all pages..."

# Function to fix a single page
fix_page() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix the page content
    sed -E '
    # Fix HTML class attribute
    s/class="scroll-smooth"/class="scroll-smooth"/g
    
    # Fix hero section classes - standardize to hero-gradient
    s/bg-gradient-to-br from-primary to-secondary/hero-gradient/g
    s/bg-gradient-to-br from-blue-600 to-purple-700/hero-gradient/g
    s/bg-gradient-to-r from-blue-600 to-purple-700/hero-gradient/g
    
    # Fix section padding classes
    s/class="py-16 sm:py-20 lg:py-24"/class="pt-32 pb-16"/g
    s/class="py-20"/class="section-padding"/g
    
    # Fix content container classes
    s/class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"/class="content-container-wide"/g
    s/class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8"/class="content-container"/g
    s/class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8"/class="content-container-narrow"/g
    
    # Fix responsive text classes
    s/class="text-3xl sm:text-4xl lg:text-5xl"/class="responsive-heading"/g
    s/class="text-xl sm:text-2xl"/class="responsive-text"/g
    
    # Fix card classes
    s/class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6"/class="card"/g
    s/class="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6"/class="card"/g
    
    # Fix button classes
    s/class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded"/class="btn-primary"/g
    s/class="bg-purple-600 hover:bg-purple-700 text-white font-semibold py-2 px-4 rounded"/class="btn-secondary"/g
    
    # Fix navigation link classes
    s/class="text-gray-700 dark:text-gray-300 hover:text-blue-600"/class="nav-link"/g
    
    # Fix dark mode transition
    s/class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white transition-colors duration-300"/class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white dark-mode-transition"/g
    
    # Fix mobile menu classes
    s/class="hidden lg:hidden bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700"/class="hidden lg:hidden bg-white\/98 dark:bg-gray-900\/98 backdrop-blur-xl border-t border-gray-200\/50 dark:border-gray-700\/50 shadow-xl"/g
    
    # Fix form input classes
    s/class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent dark:bg-gray-800"/class="form-input"/g
    
    # Fix label classes
    s/class="block text-sm font-medium mb-2"/class="form-label"/g
    
    # Fix prose classes
    s/class="prose prose-lg dark:prose-invert max-w-none"/class="prose prose-lg dark:prose-invert max-w-none mb-12"/g
    
    # Fix grid classes for consistency
    s/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8"/g
    s/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8"/g
    
    # Fix spacing classes
    s/class="mb-8"/class="mb-12"/g
    s/class="mb-6"/class="mb-8"/g
    
    # Fix text color classes for consistency
    s/class="text-gray-600 dark:text-gray-400"/class="text-gray-600 dark:text-gray-300"/g
    s/class="text-gray-500 dark:text-gray-400"/class="text-gray-600 dark:text-gray-300"/g
    
    # Fix background classes
    s/class="bg-gray-50 dark:bg-gray-800"/class="bg-gray-50 dark:bg-gray-900"/g
    
    # Fix shadow classes
    s/class="shadow-md"/class="shadow-lg"/g
    s/class="shadow-lg"/class="shadow-xl"/g
    
    # Fix border classes
    s/class="border border-gray-200 dark:border-gray-700"/class="border border-gray-100 dark:border-gray-700"/g
    
    # Fix transition classes
    s/class="transition-all duration-200"/class="transition-all duration-300"/g
    
    # Fix hover classes
    s/class="hover:bg-gray-100 dark:hover:bg-gray-700"/class="hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60"/g
    
    # Fix focus classes
    s/class="focus:ring-2 focus:ring-blue-500"/class="focus:ring-2 focus:ring-secondary"/g
    s/class="focus:ring-2 focus:ring-purple-500"/class="focus:ring-2 focus:ring-secondary"/g
    
    # Fix text size classes for consistency
    s/class="text-sm sm:text-base"/class="text-sm xl:text-base"/g
    s/class="text-base sm:text-lg"/class="text-base sm:text-lg lg:text-xl"/g
    
    # Fix padding classes
    s/class="p-4 sm:p-6"/class="p-6"/g
    s/class="px-4 sm:px-6"/class="px-4 sm:px-6 lg:px-8"/g
    
    # Fix margin classes
    s/class="mx-4 sm:mx-6"/class="mx-auto"/g
    
    # Fix rounded classes
    s/class="rounded-lg"/class="rounded-xl"/g
    s/class="rounded-md"/class="rounded-lg"/g
    
    # Fix z-index classes
    s/class="z-40"/class="z-50"/g
    
    # Fix backdrop classes
    s/class="backdrop-blur-sm"/class="backdrop-blur-xl"/g
    s/class="backdrop-blur-md"/class="backdrop-blur-xl"/g
    
    # Fix opacity classes
    s/class="bg-white\/90"/class="bg-white\/95"/g
    s/class="bg-gray-900\/90"/class="bg-gray-900\/95"/g
    
    # Fix border opacity classes
    s/class="border-gray-200\/30"/class="border-gray-200\/50"/g
    s/class="border-gray-700\/30"/class="border-gray-700\/50"/g
    ' "$file" > "$temp_file"
    
    # Replace original with fixed version
    mv "$temp_file" "$file"
}

# Function to add missing CSS classes and structure
add_missing_structure() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Adding missing structure to: $file"
    
    # Add missing CSS classes and improve structure
    sed -E '
    # Add missing dark-mode-transition class to body if not present
    /<body[^>]*class="[^"]*"/ {
        /dark-mode-transition/! {
            s/class="([^"]*)"/class="\1 dark-mode-transition"/g
        }
    }
    
    # Add missing scroll-smooth class to html if not present
    /<html[^>]*class="[^"]*"/ {
        /scroll-smooth/! {
            s/class="([^"]*)"/class="\1 scroll-smooth"/g
        }
    }
    
    # Fix missing content-container classes
    /<div[^>]*class="[^"]*max-w-[^"]*"/ {
        /content-container/! {
            s/class="([^"]*max-w-[^"]*[^"]*)"/class="\1 content-container"/g
        }
    }
    
    # Fix missing section-padding classes
    /<section[^>]*class="[^"]*py-[^"]*"/ {
        /section-padding/! {
            s/class="([^"]*py-[^"]*[^"]*)"/class="\1 section-padding"/g
        }
    }
    
    # Fix missing responsive classes
    /<h1[^>]*class="[^"]*text-[^"]*"/ {
        /responsive-heading/! {
            s/class="([^"]*text-[^"]*[^"]*)"/class="\1 responsive-heading"/g
        }
    }
    
    /<p[^>]*class="[^"]*text-[^"]*"/ {
        /responsive-text/! {
            s/class="([^"]*text-[^"]*[^"]*)"/class="\1 responsive-text"/g
        }
    }
    
    # Fix missing card classes
    /<div[^>]*class="[^"]*bg-white[^"]*"/ {
        /card/! {
            s/class="([^"]*bg-white[^"]*[^"]*)"/class="\1 card"/g
        }
    }
    
    # Fix missing button classes
    /<a[^>]*class="[^"]*bg-[^"]*[^"]*text-white[^"]*"/ {
        /btn-primary/! {
            s/class="([^"]*bg-[^"]*[^"]*text-white[^"]*[^"]*)"/class="\1 btn-primary"/g
        }
    }
    
    # Fix missing nav-link classes
    /<a[^>]*class="[^"]*text-[^"]*[^"]*hover:[^"]*"/ {
        /nav-link/! {
            s/class="([^"]*text-[^"]*[^"]*hover:[^"]*[^"]*)"/class="\1 nav-link"/g
        }
    }
    ' "$file" > "$temp_file"
    
    # Replace original with improved version
    mv "$temp_file" "$file"
}

# Function to fix navigation consistency
fix_navigation() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing navigation in: $file"
    
    # Standardize navigation structure
    sed -E '
    # Fix navigation container classes
    /<nav[^>]*class="[^"]*"/ {
        s/class="([^"]*)"/class="fixed top-0 left-0 right-0 w-full bg-white\/95 dark:bg-gray-900\/95 backdrop-blur-xl border-b border-gray-200\/50 dark:border-gray-700\/50 shadow-lg z-50 transition-all duration-300"/g
    }
    
    # Fix navigation inner container
    /<div[^>]*class="[^"]*max-w-7xl[^"]*"/ {
        s/class="([^"]*max-w-7xl[^"]*[^"]*)"/class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"/g
    }
    
    # Fix navigation flex container
    /<div[^>]*class="[^"]*flex justify-between[^"]*"/ {
        s/class="([^"]*flex justify-between[^"]*[^"]*)"/class="flex justify-between items-center h-16 sm:h-18 lg:h-20"/g
    }
    
    # Fix logo container
    /<div[^>]*class="[^"]*flex items-center[^"]*"/ {
        /flex-shrink-0/! {
            s/class="([^"]*flex items-center[^"]*[^"]*)"/class="\1 flex-shrink-0"/g
        }
    }
    
    # Fix logo link
    /<a[^>]*href="\/"[^>]*class="[^"]*flex items-center[^"]*"/ {
        s/class="([^"]*flex items-center[^"]*[^"]*)"/class="flex items-center space-x-2 sm:space-x-3 group"/g
    }
    
    # Fix logo image
    /<img[^>]*src="[^"]*favicon[^"]*"/ {
        s/class="([^"]*)"/class="w-6 h-6 sm:w-7 sm:h-7 lg:w-8 lg:h-8 transition-all duration-300 group-hover:scale-105"/g
    }
    
    # Fix logo text
    /<span[^>]*class="[^"]*font-heading[^"]*"/ {
        s/class="([^"]*font-heading[^"]*[^"]*)"/class="font-heading font-bold text-base sm:text-lg lg:text-xl xl:text-2xl text-gray-900 dark:text-white"/g
    }
    
    # Fix desktop navigation
    /<div[^>]*class="[^"]*hidden lg:flex[^"]*"/ {
        s/class="([^"]*hidden lg:flex[^"]*[^"]*)"/class="hidden lg:flex items-center space-x-6 xl:space-x-8"/g
    }
    
    # Fix navigation links
    /<a[^>]*href="\/#[^"]*"[^>]*class="[^"]*"/ {
        s/class="([^"]*)"/class="nav-link text-sm xl:text-base"/g
    }
    
    # Fix right side controls
    /<div[^>]*class="[^"]*flex items-center[^"]*space-x-[^"]*"/ {
        s/class="([^"]*flex items-center[^"]*space-x-[^"]*[^"]*)"/class="flex items-center space-x-2 sm:space-x-3"/g
    }
    
    # Fix dark mode toggle
    /<button[^>]*id="darkModeToggle"/ {
        s/class="([^"]*)"/class="p-2 sm:p-3 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary\/30"/g
    }
    
    # Fix mobile menu button
    /<button[^>]*id="mobileMenuButton"/ {
        s/class="([^"]*)"/class="lg:hidden p-2 sm:p-3 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary\/30"/g
    }
    
    # Fix mobile menu
    /<div[^>]*id="mobileMenu"/ {
        s/class="([^"]*)"/class="hidden lg:hidden bg-white\/98 dark:bg-gray-900\/98 backdrop-blur-xl border-t border-gray-200\/50 dark:border-gray-700\/50 shadow-xl"/g
    }
    
    # Fix mobile menu container
    /<div[^>]*class="[^"]*max-w-7xl[^"]*"[^>]*id="mobileMenu"/! {
        /<div[^>]*class="[^"]*max-w-7xl[^"]*"/ {
            /py-4/ {
                s/class="([^"]*max-w-7xl[^"]*[^"]*)"/class="max-w-7xl mx-auto px-4 sm:px-6 py-4 space-y-1"/g
            }
        }
    }
    
    # Fix mobile menu links
    /<a[^>]*href="\/#[^"]*"[^>]*class="[^"]*block[^"]*"/ {
        s/class="([^"]*block[^"]*[^"]*)"/class="block py-3 px-4 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg"/g
    }
    ' "$file" > "$temp_file"
    
    # Replace original with fixed navigation
    mv "$temp_file" "$file"
}

# Function to fix hero sections
fix_hero_sections() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing hero section in: $file"
    
    # Standardize hero section structure
    sed -E '
    # Fix hero section classes
    /<section[^>]*class="[^"]*pt-[^"]*"/ {
        /hero-gradient/! {
            s/class="([^"]*pt-[^"]*[^"]*)"/class="pt-32 pb-16 hero-gradient text-white relative overflow-hidden"/g
        }
    }
    
    # Fix hero content container
    /<div[^>]*class="[^"]*text-center[^"]*"/ {
        /content-container/! {
            s/class="([^"]*text-center[^"]*[^"]*)"/class="\1 content-container"/g
        }
    }
    
    # Fix hero heading
    /<h1[^>]*class="[^"]*font-heading[^"]*"/ {
        /responsive-heading/! {
            s/class="([^"]*font-heading[^"]*[^"]*)"/class="\1 responsive-heading"/g
        }
    }
    
    # Fix hero description
    /<p[^>]*class="[^"]*text-[^"]*[^"]*mb-[^"]*"/ {
        /responsive-text/! {
            s/class="([^"]*text-[^"]*[^"]*mb-[^"]*[^"]*)"/class="\1 responsive-text"/g
        }
    }
    
    # Add missing text color classes
    /<p[^>]*class="[^"]*responsive-text[^"]*"/ {
        /text-gray-200/! {
            s/class="([^"]*responsive-text[^"]*[^"]*)"/class="\1 text-gray-200"/g
        }
    }
    
    # Fix hero button container
    /<div[^>]*class="[^"]*flex[^"]*[^"]*gap-[^"]*"/ {
        s/class="([^"]*flex[^"]*[^"]*gap-[^"]*[^"]*)"/class="flex flex-col sm:flex-row gap-4 justify-center"/g
    }
    
    # Fix hero buttons
    /<a[^>]*class="[^"]*bg-[^"]*[^"]*text-white[^"]*"/ {
        /btn-primary/! {
            s/class="([^"]*bg-[^"]*[^"]*text-white[^"]*[^"]*)"/class="\1 btn-primary btn-lg"/g
        }
    }
    ' "$file" > "$temp_file"
    
    # Replace original with fixed hero section
    mv "$temp_file" "$file"
}

# Function to fix content sections
fix_content_sections() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing content sections in: $file"
    
    # Standardize content section structure
    sed -E '
    # Fix content section classes
    /<section[^>]*class="[^"]*py-[^"]*"/ {
        /section-padding/! {
            s/class="([^"]*py-[^"]*[^"]*)"/class="\1 section-padding"/g
        }
    }
    
    # Fix content container
    /<div[^>]*class="[^"]*max-w-[^"]*"/ {
        /content-container/! {
            s/class="([^"]*max-w-[^"]*[^"]*)"/class="\1 content-container"/g
        }
    }
    
    # Fix prose sections
    /<div[^>]*class="[^"]*prose[^"]*"/ {
        /mb-12/! {
            s/class="([^"]*prose[^"]*[^"]*)"/class="\1 mb-12"/g
        }
    }
    
    # Fix grid sections
    /<div[^>]*class="[^"]*grid[^"]*"/ {
        /gap-8/! {
            s/class="([^"]*grid[^"]*[^"]*)"/class="\1 gap-8"/g
        }
    }
    
    # Fix card sections
    /<div[^>]*class="[^"]*bg-white[^"]*"/ {
        /card/! {
            s/class="([^"]*bg-white[^"]*[^"]*)"/class="\1 card"/g
        }
    }
    
    # Fix button sections
    /<a[^>]*class="[^"]*bg-[^"]*[^"]*text-white[^"]*"/ {
        /btn-primary/! {
            s/class="([^"]*bg-[^"]*[^"]*text-white[^"]*[^"]*)"/class="\1 btn-primary"/g
        }
    }
    ' "$file" > "$temp_file"
    
    # Replace original with fixed content sections
    mv "$temp_file" "$file"
}

# Function to fix footer
fix_footer() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing footer in: $file"
    
    # Standardize footer structure
    sed -E '
    # Fix footer classes
    /<footer[^>]*class="[^"]*"/ {
        s/class="([^"]*)"/class="bg-primary text-white py-12"/g
    }
    
    # Fix footer container
    /<div[^>]*class="[^"]*max-w-[^"]*"[^>]*footer/! {
        /<div[^>]*class="[^"]*max-w-[^"]*"/ {
            s/class="([^"]*max-w-[^"]*[^"]*)"/class="content-container-wide"/g
        }
    }
    
    # Fix footer grid
    /<div[^>]*class="[^"]*grid[^"]*"[^>]*footer/! {
        /<div[^>]*class="[^"]*grid[^"]*"/ {
            s/class="([^"]*grid[^"]*[^"]*)"/class="\1 gap-8"/g
        }
    }
    
    # Fix footer text colors
    /<p[^>]*class="[^"]*text-[^"]*[^"]*footer/! {
        /<p[^>]*class="[^"]*text-[^"]*"/ {
            /text-gray-300/! {
                s/class="([^"]*text-[^"]*[^"]*)"/class="\1 text-gray-300"/g
            }
        }
    }
    
    # Fix footer links
    /<a[^>]*class="[^"]*text-[^"]*[^"]*footer/! {
        /<a[^>]*class="[^"]*text-[^"]*"/ {
            /text-gray-300/! {
                s/class="([^"]*text-[^"]*[^"]*)"/class="\1 text-gray-300 hover:text-white transition-colors"/g
            }
        }
    }
    ' "$file" > "$temp_file"
    
    # Replace original with fixed footer
    mv "$temp_file" "$file"
}

# Function to fix floating elements
fix_floating_elements() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing floating elements in: $file"
    
    # Standardize floating elements
    sed -E '
    # Fix floating compare button
    /<a[^>]*href="#compare"/ {
        s/class="([^"]*)"/class="fixed bottom-6 right-6 bg-secondary hover:bg-secondary\/90 text-white p-4 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 z-40 group hover:scale-105 focus:outline-none focus:ring-2 focus:ring-secondary\/30 border border-white\/10"/g
    }
    
    # Fix floating action buttons
    /<button[^>]*class="[^"]*fixed[^"]*"/ {
        s/class="([^"]*fixed[^"]*[^"]*)"/class="\1 z-40"/g
    }
    
    # Fix z-index for floating elements
    /<div[^>]*class="[^"]*fixed[^"]*"/ {
        /z-[0-9]+/! {
            s/class="([^"]*fixed[^"]*[^"]*)"/class="\1 z-40"/g
        }
    }
    ' "$file" > "$temp_file"
    
    # Replace original with fixed floating elements
    mv "$temp_file" "$file"
}

# Function to fix JavaScript references
fix_javascript() {
    local file="$1"
    local temp_file="${file}.temp"
    
    echo "Fixing JavaScript references in: $file"
    
    # Standardize JavaScript references
    sed -E '
    # Fix JavaScript file path
    s/src="\.\/src\/js\/main\.js"/src="\/src\/js\/main.js"/g
    s/src="src\/js\/main\.js"/src="\/src\/js\/main.js"/g
    
    # Fix CSS file path
    s/href="\.\/dist\/output\.css/href="\/dist\/output.css/g
    s/href="dist\/output\.css/href="\/dist\/output.css/g
    
    # Fix favicon paths
    s/href="\.\/public\/favicon/href="\/public\/favicon/g
    s/href="public\/favicon/href="\/public\/favicon/g
    s/src="\.\/public\/favicon/src="\/public\/favicon/g
    s/src="public\/favicon/src="\/public\/favicon/g
    
    # Fix image paths
    s/src="\.\/public\/images/src="\/public\/images/g
    s/src="public\/images/src="\/public\/images/g
    ' "$file" > "$temp_file"
    
    # Replace original with fixed JavaScript references
    mv "$temp_file" "$file"
}

# Main execution
echo "Starting comprehensive fix for all HTML files..."

# Fix main pages
for file in index.html privacy.html terms.html; do
    if [ -f "$file" ]; then
        echo "Processing main page: $file"
        fix_page "$file"
        add_missing_structure "$file"
        fix_navigation "$file"
        fix_hero_sections "$file"
        fix_content_sections "$file"
        fix_footer "$file"
        fix_floating_elements "$file"
        fix_javascript "$file"
    fi
done

# Fix category pages
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        for file in "$dir"*.html; do
            if [ -f "$file" ]; then
                echo "Processing category page: $file"
                fix_page "$file"
                add_missing_structure "$file"
                fix_navigation "$file"
                fix_hero_sections "$file"
                fix_content_sections "$file"
                fix_footer "$file"
                fix_floating_elements "$file"
                fix_javascript "$file"
            fi
        done
    fi
done

# Fix src/pages files if they exist
if [ -d "src/pages" ]; then
    for file in src/pages/**/*.html; do
        if [ -f "$file" ]; then
            echo "Processing src page: $file"
            fix_page "$file"
            add_missing_structure "$file"
            fix_navigation "$file"
            fix_hero_sections "$file"
            fix_content_sections "$file"
            fix_footer "$file"
            fix_floating_elements "$file"
            fix_javascript "$file"
        fi
    done
fi

echo "Comprehensive universal fix completed!"
echo "All pages have been standardized with uniform layout and styling."
echo "Backups have been created with timestamps." 