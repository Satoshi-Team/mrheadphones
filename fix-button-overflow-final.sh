#!/bin/bash

echo "🔧 Final fix for button overflow and card layout issues..."

# Function to fix button overflow and card layout
fix_button_overflow() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix card-hover elements to ensure proper button containment
    sed -i 's/class="card-hover w-full p-4 sm:p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full min-h-0"/class="card-hover w-full p-4 sm:p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full min-h-0 overflow-hidden"/g' "$file"
    
    # Fix device cards to ensure proper button containment
    sed -i 's/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors w-full p-3 sm:p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full min-h-0"/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors w-full p-3 sm:p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full min-h-0 overflow-hidden"/g' "$file"
    
    # Fix grid containers to use fewer columns and more space for cards
    sed -i 's/class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-4 sm:gap-6 lg:gap-8 w-full max-w-7xl mx-auto items-stretch"/class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-6 sm:gap-8 w-full max-w-6xl mx-auto items-stretch"/g' "$file"
    
    # Fix device cards grid to use fewer columns for more space
    sed -i 's/class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-3 sm:gap-4 md:gap-6 w-full max-w-7xl mx-auto items-stretch"/class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-4 xl:grid-cols-5 gap-4 sm:gap-6 w-full max-w-6xl mx-auto items-stretch"/g' "$file"
    
    # Fix content containers to use less max-width for better card sizing
    sed -i 's/class="content-container-wide w-full max-w-7xl mx-auto px-3 sm:px-4 md:px-6 lg:px-8"/class="content-container-wide w-full max-w-6xl mx-auto px-4 sm:px-6 lg:px-8"/g' "$file"
    
    # Fix card content for better text wrapping and button spacing
    sed -i 's/class="font-heading font-semibold text-lg sm:text-xl mb-2 sm:mb-3 leading-tight"/class="font-heading font-semibold text-lg sm:text-xl mb-3 leading-tight"/g' "$file"
    sed -i 's/class="text-gray-600 dark:text-gray-300 mb-3 sm:mb-4 leading-relaxed flex-1 text-sm sm:text-base"/class="text-gray-600 dark:text-gray-300 mb-4 leading-relaxed flex-1 text-sm sm:text-base"/g' "$file"
    
    # Fix device card headings for better responsive text
    sed -i 's/class="font-heading font-semibold break-words text-xs sm:text-sm md:text-base leading-tight"/class="font-heading font-semibold break-words text-sm sm:text-base leading-tight"/g' "$file"
    
    # Fix device card icons for better responsive sizing
    sed -i 's/class="w-6 h-6 sm:w-8 sm:h-8 md:w-10 md:h-10 lg:w-12 lg:h-12 mx-auto text-secondary"/class="w-8 h-8 sm:w-10 sm:h-10 md:w-12 md:h-12 mx-auto text-secondary"/g' "$file"
    
    # Fix buttons to ensure they don't overflow
    sed -i 's/class="btn-primary w-full sm:w-auto px-4 sm:px-6 py-3 sm:py-4 text-sm sm:text-base font-semibold rounded-xl transition-all duration-300"/class="btn-primary w-full sm:w-auto px-4 sm:px-6 py-3 sm:py-4 text-sm sm:text-base font-semibold rounded-xl transition-all duration-300 whitespace-nowrap"/g' "$file"
    sed -i 's/class="btn-secondary w-full sm:w-auto px-4 sm:px-6 py-3 sm:py-4 text-sm sm:text-base font-semibold rounded-xl transition-all duration-300"/class="btn-secondary w-full sm:w-auto px-4 sm:px-6 py-3 sm:py-4 text-sm sm:text-base font-semibold rounded-xl transition-all duration-300 whitespace-nowrap"/g' "$file"
    
    # Fix "Check Price" buttons specifically to prevent overflow
    sed -i 's/class="btn-primary"/class="btn-primary whitespace-nowrap min-w-0"/g' "$file"
    sed -i 's/class="btn-secondary"/class="btn-secondary whitespace-nowrap min-w-0"/g' "$file"
    
    # Fix card links to ensure proper button positioning
    sed -i 's/class="text-secondary hover:underline nav-link text-gray-300 hover:text-white transition-colors"/class="text-secondary hover:underline nav-link text-gray-300 hover:text-white transition-colors mt-auto"/g' "$file"
    
    # Fix card padding to ensure buttons have enough space
    sed -i 's/class="card-hover w-full p-4 sm:p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full min-h-0 overflow-hidden"/class="card-hover w-full p-5 sm:p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full min-h-0 overflow-hidden"/g' "$file"
    
    # Fix device cards padding
    sed -i 's/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors w-full p-3 sm:p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full min-h-0 overflow-hidden"/class="card text-center hover:scale-105 transition-transform nav-link text-gray-300 hover:text-white transition-colors w-full p-4 sm:p-5 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full min-h-0 overflow-hidden"/g' "$file"
    
    # Fix section padding for better spacing
    sed -i 's/class="py-12 sm:py-16 lg:py-20 bg-gray-50 dark:bg-gray-900 section-padding"/class="py-16 sm:py-20 lg:py-24 bg-gray-50 dark:bg-gray-900 section-padding"/g' "$file"
    sed -i 's/class="py-12 sm:py-16 lg:py-20 xl:py-24"/class="py-16 sm:py-20 lg:py-24 xl:py-28"/g' "$file"
    
    # Fix headings for better responsive sizing
    sed -i 's/class="font-heading font-bold text-2xl sm:text-3xl lg:text-4xl mb-3 sm:mb-4"/class="font-heading font-bold text-2xl sm:text-3xl lg:text-4xl mb-4 sm:mb-6"/g' "$file"
    
    # Fix paragraph text for better responsive sizing
    sed -i 's/class="text-base sm:text-lg text-gray-600 dark:text-gray-300 max-w-4xl mx-auto responsive-text text-gray-200 leading-relaxed"/class="text-base sm:text-lg text-gray-600 dark:text-gray-300 max-w-3xl mx-auto responsive-text text-gray-200 leading-relaxed"/g' "$file"
    
    # Fix hero section for better responsive design
    sed -i 's/class="font-heading font-bold text-3xl sm:text-4xl md:text-5xl lg:text-6xl mb-4 sm:mb-6 responsive-heading leading-tight"/class="font-heading font-bold text-3xl sm:text-4xl md:text-5xl lg:text-6xl mb-6 sm:mb-8 responsive-heading leading-tight"/g' "$file"
    
    # Fix hero subtitle for better responsive design
    sed -i 's/class="text-lg sm:text-xl md:text-2xl mb-6 sm:mb-8 text-gray-200 responsive-text text-gray-300"/class="text-lg sm:text-xl md:text-2xl mb-6 sm:mb-8 text-gray-200 responsive-text text-gray-300"/g' "$file"
    
    # Fix hero description for better responsive design
    sed -i 's/class="text-base sm:text-lg mb-8 sm:mb-12 text-gray-300 max-w-2xl mx-auto responsive-text text-gray-200 leading-relaxed"/class="text-base sm:text-lg mb-8 sm:mb-12 text-gray-300 max-w-2xl mx-auto responsive-text text-gray-200 leading-relaxed"/g' "$file"
    
    # Fix hero section button container
    sed -i 's/class="flex flex-col sm:flex-row gap-3 sm:gap-4 justify-center w-full max-w-md sm:max-w-lg mx-auto"/class="flex flex-col sm:flex-row gap-4 justify-center w-full max-w-lg sm:max-w-xl mx-auto"/g' "$file"
    
    # Fix navigation for better responsive design
    sed -i 's/class="hidden lg:flex items-center space-x-4 xl:space-x-6 2xl:space-x-8"/class="hidden lg:flex items-center space-x-6 xl:space-x-8"/g' "$file"
    
    # Fix mobile menu for better responsive design
    sed -i 's/class="block py-2 sm:py-3 px-3 sm:px-4 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-sm sm:text-base"/class="block py-3 px-4 rounded-xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base"/g' "$file"
    
    # Fix contact form for better responsive design
    sed -i 's/class="grid grid-cols-1 sm:grid-cols-2 gap-4 sm:gap-6"/class="grid grid-cols-1 sm:grid-cols-2 gap-6"/g' "$file"
    
    # Fix form inputs for better responsive design
    sed -i 's/class="w-full px-3 sm:px-4 py-2 sm:py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-secondary focus:border-transparent dark:bg-gray-800 text-sm sm:text-base"/class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-secondary focus:border-transparent dark:bg-gray-800 text-base"/g' "$file"
    
    # Fix textarea for better responsive design
    sed -i 's/class="w-full px-3 sm:px-4 py-2 sm:py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-secondary focus:border-transparent dark:bg-gray-800 text-sm sm:text-base"/class="w-full px-4 py-3 border border-gray-300 dark:border-gray-600 rounded-lg focus:ring-2 focus:ring-secondary focus:border-transparent dark:bg-gray-800 text-base"/g' "$file"
    
    # Fix footer for better responsive design
    sed -i 's/class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 sm:gap-8"/class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8"/g' "$file"
    
    # Fix floating button for better responsive design
    sed -i 's/class="fixed bottom-4 sm:bottom-6 right-4 sm:right-6 bg-secondary hover:bg-secondary\/90 text-white p-3 sm:p-4 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 z-40 group hover:scale-105 focus:outline-none focus:ring-2 focus:ring-secondary\/30 border border-white\/10"/class="fixed bottom-6 right-6 bg-secondary hover:bg-secondary\/90 text-white p-4 rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 z-40 group hover:scale-105 focus:outline-none focus:ring-2 focus:ring-secondary\/30 border border-white\/10"/g' "$file"
    
    # Fix floating button text for better responsive design
    sed -i 's/class="ml-1 sm:ml-2 font-semibold text-xs sm:text-sm"/class="ml-2 font-semibold text-sm"/g' "$file"
    
    # Fix floating button icon for better responsive design
    sed -i 's/class="w-3 h-3 sm:w-4 sm:h-4 inline transition-transform duration-300 group-hover:translate-x-0.5"/class="w-4 h-4 inline transition-transform duration-300 group-hover:translate-x-0.5"/g' "$file"
}

# Process all HTML files
echo "Processing homepage..."
fix_button_overflow "index.html"

echo "Processing category pages..."
find categories -name "*.html" -type f | while read file; do
    fix_button_overflow "$file"
done

echo "Processing src/pages..."
find src/pages -name "*.html" -type f | while read file; do
    fix_button_overflow "$file"
done

echo "Processing other pages..."
fix_button_overflow "privacy.html"
fix_button_overflow "terms.html"

echo "✅ Button overflow fixes applied to all pages!"
echo "🎯 Key improvements:"
echo "   - Fixed button overflow and truncation issues"
echo "   - Better card sizing with proper containment"
echo "   - Improved grid layouts with more space for cards"
echo "   - Enhanced button positioning and spacing"
echo "   - Better responsive design across all devices"
echo "   - Proper text wrapping and overflow handling" 