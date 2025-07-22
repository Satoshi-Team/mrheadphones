#!/bin/bash

# Script to add translation data attributes to all HTML files
echo "Adding translation data attributes to HTML files..."

# Function to add translation attributes to a single HTML file
add_translations() {
    local file="$1"
    
    # Add language script to head section
    sed -i '/<script src="\/src\/js\/main.js"><\/script>/a \    <script src="/src/js/languages.js"></script>' "$file"
    
    # Add translation attributes to navigation
    sed -i 's/<a href="\/#home" class="nav-link">Home<\/a>/<a href="\/#home" class="nav-link" data-translate="nav_home">Home<\/a>/g' "$file"
    sed -i 's/<a href="\/#categories" class="nav-link">Categories<\/a>/<a href="\/#categories" class="nav-link" data-translate="nav_categories">Categories<\/a>/g' "$file"
    sed -i 's/<a href="\/#devices" class="nav-link">Devices<\/a>/<a href="\/#devices" class="nav-link" data-translate="nav_devices">Devices<\/a>/g' "$file"
    sed -i 's/<a href="\/#solutions" class="nav-link">Solutions<\/a>/<a href="\/#solutions" class="nav-link" data-translate="nav_solutions">Solutions<\/a>/g' "$file"
    sed -i 's/<a href="\/#budget" class="nav-link">Budget<\/a>/<a href="\/#budget" class="nav-link" data-translate="nav_budget">Budget<\/a>/g' "$file"
    
    # Add translation attributes to mobile navigation
    sed -i 's/<a href="\/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">Home<\/a>/<a href="\/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_home">Home<\/a>/g' "$file"
    sed -i 's/<a href="\/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">Categories<\/a>/<a href="\/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_categories">Categories<\/a>/g' "$file"
    sed -i 's/<a href="\/#devices" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">Devices<\/a>/<a href="\/#devices" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_devices">Devices<\/a>/g' "$file"
    sed -i 's/<a href="\/#solutions" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">Solutions<\/a>/<a href="\/#solutions" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_solutions">Solutions<\/a>/g' "$file"
    sed -i 's/<a href="\/#budget" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">Budget<\/a>/<a href="\/#budget" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_budget">Budget<\/a>/g' "$file"
    
    # Add translation attributes to hero section
    sed -i 's/<h1 class="font-heading font-bold responsive-heading mb-6">Find Your Perfect Headphones<\/h1>/<h1 class="font-heading font-bold responsive-heading mb-6" data-translate="hero_title">Find Your Perfect Headphones<\/h1>/g' "$file"
    sed -i 's/<p class="responsive-text mb-8 text-gray-200 max-w-4xl mx-auto">Expert reviews and recommendations for every need, from gaming to music to work.<\/p>/<p class="responsive-text mb-8 text-gray-200 max-w-4xl mx-auto" data-translate="hero_subtitle">Expert reviews and recommendations for every need, from gaming to music to work.<\/p>/g' "$file"
    
    # Add translation attributes to buttons
    sed -i 's/<a href="#categories" class="btn-primary btn-lg">Explore Categories<\/a>/<a href="#categories" class="btn-primary btn-lg" data-translate="hero_cta_primary">Explore Categories<\/a>/g' "$file"
    sed -i 's/<a href="#compare" class="btn-secondary btn-lg">Compare Headphones<\/a>/<a href="#compare" class="btn-secondary btn-lg" data-translate="hero_cta_secondary">Compare Headphones<\/a>/g' "$file"
    
    # Add translation attributes to section titles
    sed -i 's/<h2 class="font-heading font-bold text-2xl sm:text-3xl mb-8 text-center">Browse by Category<\/h2>/<h2 class="font-heading font-bold text-2xl sm:text-3xl mb-8 text-center" data-translate="section_categories_title">Browse by Category<\/h2>/g' "$file"
    sed -i 's/<p class="text-gray-600 dark:text-gray-300 text-center mb-12 max-w-3xl mx-auto">Find headphones tailored to your specific needs and preferences.<\/p>/<p class="text-gray-600 dark:text-gray-300 text-center mb-12 max-w-3xl mx-auto" data-translate="section_categories_subtitle">Find headphones tailored to your specific needs and preferences.<\/p>/g' "$file"
    
    # Add translation attributes to footer
    sed -i 's/<h3 class="font-heading font-semibold text-lg mb-4">Quick Links<\/h3>/<h3 class="font-heading font-semibold text-lg mb-4" data-translate="footer_quick_links">Quick Links<\/h3>/g' "$file"
    sed -i 's/<h3 class="font-heading font-semibold text-lg mb-4">Connect<\/h3>/<h3 class="font-heading font-semibold text-lg mb-4" data-translate="footer_connect">Connect<\/h3>/g' "$file"
    sed -i 's/<li><a href="#" class="text-gray-300 hover:text-white transition-colors">About<\/a><\/li>/<li><a href="#" class="text-gray-300 hover:text-white transition-colors" data-translate="btn_about">About<\/a><\/li>/g' "$file"
    sed -i 's/<li><a href="mailto:hello@mrheadphones.com" class="text-gray-300 hover:text-white transition-colors">Email<\/a><\/li>/<li><a href="mailto:hello@mrheadphones.com" class="text-gray-300 hover:text-white transition-colors" data-translate="btn_email">Email<\/a><\/li>/g' "$file"
    sed -i 's/<li><a href="\/privacy.html" class="text-gray-300 hover:text-white transition-colors">Privacy<\/a><\/li>/<li><a href="\/privacy.html" class="text-gray-300 hover:text-white transition-colors" data-translate="btn_privacy">Privacy<\/a><\/li>/g' "$file"
    sed -i 's/<li><a href="\/terms.html" class="text-gray-300 hover:text-white transition-colors">Terms<\/a><\/li>/<li><a href="\/terms.html" class="text-gray-300 hover:text-white transition-colors" data-translate="btn_terms">Terms<\/a><\/li>/g' "$file"
    
    # Add translation attributes to Read More buttons
    sed -i 's/<span class="btn-primary btn-sm">Read More<\/span>/<span class="btn-primary btn-sm" data-translate="btn_read_more">Read More<\/span>/g' "$file"
    
    # Add translation attributes to FAQ and Related Articles sections
    sed -i 's/<h2 class="font-heading font-bold text-2xl sm:text-3xl mb-8 text-center">Frequently Asked Questions<\/h2>/<h2 class="font-heading font-bold text-2xl sm:text-3xl mb-8 text-center" data-translate="faq_title">Frequently Asked Questions<\/h2>/g' "$file"
    sed -i 's/<h2 class="font-heading font-bold text-2xl sm:text-3xl mb-8 text-center">Related Articles<\/h2>/<h2 class="font-heading font-bold text-2xl sm:text-3xl mb-8 text-center" data-translate="related_articles_title">Related Articles<\/h2>/g' "$file"
    
    # Add translation attributes to accessibility elements
    sed -i 's/aria-label="Toggle dark mode"/aria-label="Toggle dark mode" data-translate-title="dark_mode_toggle"/g' "$file"
    sed -i 's/aria-label="Toggle mobile menu"/aria-label="Toggle mobile menu" data-translate-title="mobile_menu_toggle"/g' "$file"
    
    echo "Added translation attributes to: $file"
}

# Process all category directories
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        html_file="$dir/index.html"
        if [ -f "$html_file" ]; then
            add_translations "$html_file"
        fi
    fi
done

# Also process the main index.html file
if [ -f "index.html" ]; then
    add_translations "index.html"
fi

# Process privacy and terms pages
if [ -f "privacy.html" ]; then
    add_translations "privacy.html"
fi

if [ -f "terms.html" ]; then
    add_translations "terms.html"
fi

echo "Translation attributes added to all HTML files!"
echo "Next step: Create translation files for each language." 