#!/bin/bash

echo "🔧 Comprehensive page fix and design improvement..."

# Update CSS version and fix all pages
find categories -name "*.html" -type f | while read -r file; do
    echo "Processing: $file"
    
    # Update CSS version to latest
    sed -i 's|href="/dist/output.css?v=1.0.1"|href="/dist/output.css?v=1.0.2"|g' "$file"
    sed -i 's|href="/dist/output.css?v=1.0.0"|href="/dist/output.css?v=1.0.2"|g' "$file"
    
    # Update favicon version
    sed -i 's|href="/public/favicon.svg?v=1.0.1"|href="/public/favicon.svg?v=1.0.2"|g' "$file"
    
    # Fix body classes for better dark mode support
    sed -i 's|class="bg-background-light dark:bg-background-dark text-text-light dark:text-text-dark transition-colors duration-200"|class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white dark-mode-transition"|g' "$file"
    
    # Fix navigation background for better glass effect
    sed -i 's|class="fixed top-0 w-full bg-white/90 dark:bg-background-dark/90 backdrop-blur-sm z-50 border-b border-gray-200 dark:border-gray-700"|class="fixed top-0 w-full glass-effect z-50 border-b border-gray-200 dark:border-gray-700"|g' "$file"
    
    # Fix mobile menu background
    sed -i 's|class="hidden md:hidden bg-white dark:bg-background-dark border-t border-gray-200 dark:border-gray-700"|class="hidden md:hidden bg-white dark:bg-gray-900 border-t border-gray-200 dark:border-gray-700"|g' "$file"
    
    # Improve hero section with better gradient
    sed -i 's|class="pt-32 pb-16 bg-hero-gradient text-white"|class="pt-32 pb-16 hero-gradient text-white relative overflow-hidden"|g' "$file"
    
    # Add better spacing classes
    sed -i 's|class="py-12"|class="section-padding"|g' "$file"
    sed -i 's|class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8"|class="max-w-4xl mx-auto container-padding"|g' "$file"
    
    # Improve button classes
    sed -i 's|class="btn-primary"|class="btn-primary focus-visible"|g' "$file"
    sed -i 's|class="btn-secondary"|class="btn-secondary focus-visible"|g' "$file"
    
    # Improve card classes
    sed -i 's|class="card"|class="card-hover"|g' "$file"
    
    # Fix mobile menu button size inconsistency
    sed -i 's|class="md:hidden p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700"|class="md:hidden p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 focus-visible"|g' "$file"
    
    # Improve dark mode toggle
    sed -i 's|class="p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 transition-colors"|class="p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 focus-visible"|g' "$file"
    
    # Add better responsive text classes
    sed -i 's|class="text-lg sm:text-xl mb-8 text-gray-200 max-w-3xl mx-auto"|class="responsive-text mb-8 text-gray-200 max-w-3xl mx-auto"|g' "$file"
    
    # Improve heading classes
    sed -i 's|class="font-heading font-bold text-3xl sm:text-4xl lg:text-5xl mb-6"|class="font-heading font-bold responsive-heading mb-6"|g' "$file"
    
    echo "✅ Enhanced design in $file"
done

# Also fix the main index.html
echo "Processing: index.html"
sed -i 's|href="/dist/output.css?v=1.0.1"|href="/dist/output.css?v=1.0.2"|g' "index.html"
sed -i 's|class="bg-background-light dark:bg-background-dark text-text-light dark:text-text-dark transition-colors duration-200"|class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white dark-mode-transition"|g' "index.html"
sed -i 's|class="fixed top-0 w-full bg-white/90 dark:bg-background-dark/90 backdrop-blur-sm z-50 border-b border-gray-200 dark:border-gray-700"|class="fixed top-0 w-full glass-effect z-50 border-b border-gray-200 dark:border-gray-700"|g' "index.html"

echo "🎉 All pages have been enhanced with improved design!" 