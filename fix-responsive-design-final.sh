#!/bin/bash

echo "🔧 Final comprehensive responsive design fix for buttons and cards..."

# Function to fix responsive design issues
fix_responsive_design() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix card-hover elements with better responsive design
    sed -i 's/class="card-hover w-full p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full"/class="card-hover w-full p-4 sm:p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full min-h-0"/g' "$file"
    
    # Fix device cards with better responsive design
    sed -i 's/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors w-full p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full"/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors w-full p-3 sm:p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full min-h-0"/g' "$file"
    
    # Fix grid containers for better responsive layout
    sed -i 's/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-8 w-full max-w-7xl mx-auto items-stretch"/class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-4 sm:gap-6 lg:gap-8 w-full max-w-7xl mx-auto items-stretch"/g' "$file"
    
    # Fix device cards grid for better responsive layout
    sed -i 's/class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-6 gap-6 w-full max-w-7xl mx-auto items-stretch"/class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-3 sm:gap-4 md:gap-6 w-full max-w-7xl mx-auto items-stretch"/g' "$file"
    
    # Fix button containers and buttons for better responsive design
    sed -i 's/class="btn-primary btn-lg"/class="btn-primary w-full sm:w-auto px-4 sm:px-6 py-3 sm:py-4 text-sm sm:text-base font-semibold rounded-xl transition-all duration-300"/g' "$file"
    sed -i 's/class="btn-secondary btn-lg"/class="btn-secondary w-full sm:w-auto px-4 sm:px-6 py-3 sm:py-4 text-sm sm:text-base font-semibold rounded-xl transition-all duration-300"/g' "$file"
    
    # Fix hero section button container
    sed -i 's/class="flex flex-col sm:flex-row gap-4 justify-center"/class="flex flex-col sm:flex-row gap-3 sm:gap-4 justify-center w-full max-w-md sm:max-w-lg mx-auto"/g' "$file"
    
    # Fix card content for better text wrapping and spacing
    sed -i 's/class="font-heading font-semibold text-xl mb-3"/class="font-heading font-semibold text-lg sm:text-xl mb-2 sm:mb-3 leading-tight"/g' "$file"
    sed -i 's/class="text-gray-600 dark:text-gray-300 mb-4 leading-relaxed flex-1"/class="text-gray-600 dark:text-gray-300 mb-3 sm:mb-4 leading-relaxed flex-1 text-sm sm:text-base"/g' "$file"
    
    # Fix device card headings for better responsive text
    sed -i 's/class="font-heading font-semibold break-words text-base leading-tight"/class="font-heading font-semibold break-words text-xs sm:text-sm md:text-base leading-tight"/g' "$file"
    
    # Fix device card icons for better responsive sizing
    sed -i 's/class="w-8 h-8 sm:w-10 sm:h-10 lg:w-12 lg:h-12 mx-auto text-secondary"/class="w-6 h-6 sm:w-8 sm:h-8 md:w-10 md:h-10 lg:w-12 lg:h-12 mx-auto text-secondary"/g' "$file"
    
    # Fix content containers for better responsive padding
    sed -i 's/class="content-container-wide w-full max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"/class="content-container-wide w-full max-w-7xl mx-auto px-3 sm:px-4 md:px-6 lg:px-8"/g' "$file"
    
    # Fix section padding for better responsive spacing
    sed -i 's/class="py-20 bg-gray-50 dark:bg-gray-900 section-padding"/class="py-12 sm:py-16 lg:py-20 bg-gray-50 dark:bg-gray-900 section-padding"/g' "$file"
    sed -i 's/class="py-16 lg:py-24"/class="py-12 sm:py-16 lg:py-20 xl:py-24"/g' "$file"
    
    # Fix headings for better responsive sizing
    sed -i 's/class="font-heading font-bold text-3xl sm:text-4xl mb-4"/class="font-heading font-bold text-2xl sm:text-3xl lg:text-4xl mb-3 sm:mb-4"/g' "$file"
    
    # Fix paragraph text for better responsive sizing
    sed -i 's/class="text-lg text-gray-600 dark:text-gray-300 max-w-4xl mx-auto responsive-text text-gray-200"/class="text-base sm:text-lg text-gray-600 dark:text-gray-300 max-w-4xl mx-auto responsive-text text-gray-200 leading-relaxed"/g' "$file"
    
    # Fix contact form for better responsive design
    sed -i 's/class="grid grid-cols-1 md:grid-cols-2 gap-6"/class="grid grid-cols-1 sm:grid-cols-2 gap-4 sm:gap-6"/g' "$file"
    
    # Fix form inputs for better responsive design
    sed -i 's/class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-secondary focus:border-transparent dark:bg-gray-800"/class="w-full px-3 sm:px-4 py-2 sm:py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-secondary focus:border-transparent dark:bg-gray-800 text-sm sm:text-base"/g' "$file"
    
    # Fix textarea for better responsive design
    sed -i 's/class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-secondary focus:border-transparent dark:bg-gray-800"/class="w-full px-3 sm:px-4 py-2 sm:py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-secondary focus:border-transparent dark:bg-gray-800 text-sm sm:text-base"/g' "$file"
    
    # Fix navigation for better responsive design
    sed -i 's/class="hidden lg:flex items-center space-x-6 xl:space-x-8"/class="hidden lg:flex items-center space-x-4 xl:space-x-6 2xl:space-x-8"/g' "$file"
    
    # Fix mobile menu for better responsive design
    sed -i 's/class="block py-3 px-4 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg"/class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base"/g' "$file"
    
    # Fix hero section for better responsive design
    sed -i 's/class="font-heading font-bold text-4xl sm:text-5xl lg:text-6xl mb-6 responsive-heading"/class="font-heading font-bold text-3xl sm:text-4xl md:text-5xl lg:text-6xl mb-4 sm:mb-6 responsive-heading leading-tight"/g' "$file"
    
    # Fix hero subtitle for better responsive design
    sed -i 's/class="text-xl sm:text-2xl mb-8 text-gray-200 responsive-text text-gray-300"/class="text-lg sm:text-xl md:text-2xl mb-6 sm:mb-8 text-gray-200 responsive-text text-gray-300"/g' "$file"
    
    # Fix hero description for better responsive design
    sed -i 's/class="text-lg mb-12 text-gray-300 max-w-2xl mx-auto responsive-text text-gray-200"/class="text-base sm:text-lg mb-8 sm:mb-12 text-gray-300 max-w-2xl mx-auto responsive-text text-gray-200 leading-relaxed"/g' "$file"
    
    # Fix footer for better responsive design
    sed -i 's/class="grid grid-cols-1 md:grid-cols-4 gap-8"/class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 sm:gap-8"/g' "$file"
    
    # Fix floating button for better responsive design
    sed -i 's/class="fixed bottom-6 right-6 bg-secondary hover:bg-secondary\/90 text-white p-4 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 z-40 group hover:scale-105 focus:outline-none focus:ring-2 focus:ring-secondary\/30 border border-white\/10"/class="fixed bottom-4 sm:bottom-6 right-4 sm:right-6 bg-secondary hover:bg-secondary\/90 text-white p-3 sm:p-4 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 z-40 group hover:scale-105 focus:outline-none focus:ring-2 focus:ring-secondary\/30 border border-white\/10"/g' "$file"
    
    # Fix floating button text for better responsive design
    sed -i 's/class="ml-2 font-semibold text-sm"/class="ml-1 sm:ml-2 font-semibold text-xs sm:text-sm"/g' "$file"
    
    # Fix floating button icon for better responsive design
    sed -i 's/class="w-4 h-4 inline transition-transform duration-300 group-hover:translate-x-0.5"/class="w-3 h-3 sm:w-4 sm:h-4 inline transition-transform duration-300 group-hover:translate-x-0.5"/g' "$file"
}

# Process all HTML files
echo "Processing homepage..."
fix_responsive_design "index.html"

echo "Processing category pages..."
find categories -name "*.html" -type f | while read file; do
    fix_responsive_design "$file"
done

echo "Processing src/pages..."
find src/pages -name "*.html" -type f | while read file; do
    fix_responsive_design "$file"
done

echo "Processing other pages..."
fix_responsive_design "privacy.html"
fix_responsive_design "terms.html"

echo "✅ Responsive design fixes applied to all pages!"
echo "🎯 Key improvements:"
echo "   - Better mobile-first responsive design"
echo "   - Improved button sizing and spacing across devices"
echo "   - Better card layouts with proper text wrapping"
echo "   - Optimized grid systems for all screen sizes"
echo "   - Enhanced touch targets for mobile devices"
echo "   - Better typography scaling across breakpoints" 