#!/bin/bash

# Comprehensive script to add translation attributes to ALL content
echo "Adding comprehensive translation attributes to all content..."

# Function to add translations to a single HTML file
add_comprehensive_translations() {
    local file="$1"
    
    # Add languages.js script if not already present
    if ! grep -q "languages.js" "$file"; then
        sed -i '/<script src="\/src\/js\/main.js"><\/script>/a \    <script src="\/src\/js\/languages.js"><\/script>' "$file"
    fi
    
    # Navigation links
    sed -i 's/<a href="\/#home" class="nav-link">Home<\/a>/<a href="\/#home" class="nav-link" data-translate="nav_home">Home<\/a>/g' "$file"
    sed -i 's/<a href="\/#categories" class="nav-link">Categories<\/a>/<a href="\/#categories" class="nav-link" data-translate="nav_categories">Categories<\/a>/g' "$file"
    sed -i 's/<a href="\/#devices" class="nav-link">Devices<\/a>/<a href="\/#devices" class="nav-link" data-translate="nav_devices">Devices<\/a>/g' "$file"
    sed -i 's/<a href="\/#solutions" class="nav-link">Solutions<\/a>/<a href="\/#solutions" class="nav-link" data-translate="nav_solutions">Solutions<\/a>/g' "$file"
    sed -i 's/<a href="\/#budget" class="nav-link">Budget<\/a>/<a href="\/#budget" class="nav-link" data-translate="nav_budget">Budget<\/a>/g' "$file"
    
    # Logo and brand
    sed -i 's/MrHeadphones Logo/MrHeadphones Logo/g' "$file"
    sed -i 's/<span class="text-xl font-bold text-secondary">MrHeadphones<\/span>/<span class="text-xl font-bold text-secondary" data-translate="brand_name">MrHeadphones<\/span>/g' "$file"
    
    # Hero section
    sed -i 's/<h1 class="text-4xl sm:text-5xl lg:text-6xl font-bold text-white mb-6">Helping You Hear Clearly<\/h1>/<h1 class="text-4xl sm:text-5xl lg:text-6xl font-bold text-white mb-6" data-translate="hero_title">Helping You Hear Clearly<\/h1>/g' "$file"
    sed -i 's/<p class="text-xl sm:text-2xl text-white\/90 mb-8">One Headphone at a Time.<\/p>/<p class="text-xl sm:text-2xl text-white\/90 mb-8" data-translate="hero_subtitle">One Headphone at a Time.<\/p>/g' "$file"
    sed -i 's/<p class="text-lg text-white\/80 mb-8 max-w-3xl mx-auto">The Internet'\''s Ultimate Headphones Resource - Expert picks for every lifestyle, device, and audio challenge.<\/p>/<p class="text-lg text-white\/80 mb-8 max-w-3xl mx-auto" data-translate="hero_description">The Internet'\''s Ultimate Headphones Resource - Expert picks for every lifestyle, device, and audio challenge.<\/p>/g' "$file"
    
    # Hero buttons
    sed -i 's/<span class="btn-primary btn-lg">Browse Top Headphones<\/span>/<span class="btn-primary btn-lg" data-translate="btn_browse_top">Browse Top Headphones<\/span>/g' "$file"
    sed -i 's/<span class="btn-outline btn-lg">Find Headphones by Device<\/span>/<span class="btn-outline btn-lg" data-translate="btn_find_by_device">Find Headphones by Device<\/span>/g' "$file"
    sed -i 's/<span class="btn-outline btn-lg">Shop by Need<\/span>/<span class="btn-outline btn-lg" data-translate="btn_shop_by_need">Shop by Need<\/span>/g' "$file"
    
    # Main content sections
    sed -i 's/<h2 class="text-3xl sm:text-4xl font-bold text-gray-900 dark:text-white mb-4">MrHeadphones.com curates expert picks for every lifestyle, device, and audio challenge.<\/h2>/<h2 class="text-3xl sm:text-4xl font-bold text-gray-900 dark:text-white mb-4" data-translate="main_description">MrHeadphones.com curates expert picks for every lifestyle, device, and audio challenge.<\/h2>/g' "$file"
    
    # Category sections
    sed -i 's/<h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-2">General Use<\/h3>/<h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-2" data-translate="category_general_use">General Use<\/h3>/g' "$file"
    sed -i 's/<p class="text-gray-600 dark:text-gray-300 mb-4">Perfect headphones for everyday listening and common use cases.<\/p>/<p class="text-gray-600 dark:text-gray-300 mb-4" data-translate="category_general_use_desc">Perfect headphones for everyday listening and common use cases.<\/p>/g' "$file"
    sed -i 's/<span class="btn-primary btn-sm">Explore →<\/span>/<span class="btn-primary btn-sm" data-translate="btn_explore">Explore →<\/span>/g' "$file"
    
    sed -i 's/<h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-2">Study & Work<\/h3>/<h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-2" data-translate="category_study_work">Study & Work<\/h3>/g' "$file"
    sed -i 's/<p class="text-gray-600 dark:text-gray-300 mb-4">Headphones optimized for focus, productivity, and learning.<\/p>/<p class="text-gray-600 dark:text-gray-300 mb-4" data-translate="category_study_work_desc">Headphones optimized for focus, productivity, and learning.<\/p>/g' "$file"
    
    sed -i 's/<h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-2">Gaming<\/h3>/<h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-2" data-translate="category_gaming">Gaming<\/h3>/g' "$file"
    sed -i 's/<p class="text-gray-600 dark:text-gray-300 mb-4">Professional gaming headsets with immersive audio and clear communication.<\/p>/<p class="text-gray-600 dark:text-gray-300 mb-4" data-translate="category_gaming_desc">Professional gaming headsets with immersive audio and clear communication.<\/p>/g' "$file"
    
    # Device integration section
    sed -i 's/<h3 class="text-2xl font-bold text-gray-900 dark:text-white mb-6">Device Integration<\/h3>/<h3 class="text-2xl font-bold text-gray-900 dark:text-white mb-6" data-translate="section_device_integration">Device Integration<\/h3>/g' "$file"
    sed -i 's/<p class="text-lg text-gray-600 dark:text-gray-300 mb-8">Find the perfect headphones for your specific device and platform.<\/p>/<p class="text-lg text-gray-600 dark:text-gray-300 mb-8" data-translate="section_device_integration_desc">Find the perfect headphones for your specific device and platform.<\/p>/g' "$file"
    
    # Device buttons
    sed -i 's/<span class="btn-primary btn-sm">iPhone<\/span>/<span class="btn-primary btn-sm" data-translate="device_iphone">iPhone<\/span>/g' "$file"
    sed -i 's/<span class="btn-primary btn-sm">Android<\/span>/<span class="btn-primary btn-sm" data-translate="device_android">Android<\/span>/g' "$file"
    sed -i 's/<span class="btn-primary btn-sm">PS5<\/span>/<span class="btn-primary btn-sm" data-translate="device_ps5">PS5<\/span>/g' "$file"
    sed -i 's/<span class="btn-primary btn-sm">Xbox<\/span>/<span class="btn-primary btn-sm" data-translate="device_xbox">Xbox<\/span>/g' "$file"
    sed -i 's/<span class="btn-primary btn-sm">MacBook<\/span>/<span class="btn-primary btn-sm" data-translate="device_macbook">MacBook<\/span>/g' "$file"
    sed -i 's/<span class="btn-primary btn-sm">Windows<\/span>/<span class="btn-primary btn-sm" data-translate="device_windows">Windows<\/span>/g' "$file"
    
    # Specialized solutions section
    sed -i 's/<h3 class="text-2xl font-bold text-gray-900 dark:text-white mb-6">Specialized Solutions<\/h3>/<h3 class="text-2xl font-bold text-gray-900 dark:text-white mb-6" data-translate="section_specialized_solutions">Specialized Solutions<\/h3>/g' "$file"
    sed -i 's/<p class="text-lg text-gray-600 dark:text-gray-300 mb-8">Headphones designed for specific needs and challenges.<\/p>/<p class="text-lg text-gray-600 dark:text-gray-300 mb-8" data-translate="section_specialized_solutions_desc">Headphones designed for specific needs and challenges.<\/p>/g' "$file"
    
    sed -i 's/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">Kids & Seniors<\/h4>/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2" data-translate="solution_kids_seniors">Kids & Seniors<\/h4>/g' "$file"
    sed -i 's/<p class="text-gray-600 dark:text-gray-300 mb-3">Safe, comfortable headphones for all ages.<\/p>/<p class="text-gray-600 dark:text-gray-300 mb-3" data-translate="solution_kids_seniors_desc">Safe, comfortable headphones for all ages.<\/p>/g' "$file"
    sed -i 's/<span class="btn-ghost btn-sm">Learn More →<\/span>/<span class="btn-ghost btn-sm" data-translate="btn_learn_more">Learn More →<\/span>/g' "$file"
    
    sed -i 's/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">Special Needs<\/h4>/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2" data-translate="solution_special_needs">Special Needs<\/h4>/g' "$file"
    sed -i 's/<p class="text-gray-600 dark:text-gray-300 mb-3">Headphones for ADHD, autism, and hearing support.<\/p>/<p class="text-gray-600 dark:text-gray-300 mb-3" data-translate="solution_special_needs_desc">Headphones for ADHD, autism, and hearing support.<\/p>/g' "$file"
    
    sed -i 's/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">Comfort Features<\/h4>/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2" data-translate="solution_comfort_features">Comfort Features<\/h4>/g' "$file"
    sed -i 's/<p class="text-gray-600 dark:text-gray-300 mb-3">For glasses wearers, small ears, and sensitive users.<\/p>/<p class="text-gray-600 dark:text-gray-300 mb-3" data-translate="solution_comfort_features_desc">For glasses wearers, small ears, and sensitive users.<\/p>/g' "$file"
    
    # Budget section
    sed -i 's/<h3 class="text-2xl font-bold text-gray-900 dark:text-white mb-6">Budget-Friendly Options<\/h3>/<h3 class="text-2xl font-bold text-gray-900 dark:text-white mb-6" data-translate="section_budget_friendly">Budget-Friendly Options<\/h3>/g' "$file"
    sed -i 's/<p class="text-lg text-gray-600 dark:text-gray-300 mb-8">Quality headphones that won'\''t break the bank.<\/p>/<p class="text-lg text-gray-600 dark:text-gray-300 mb-8" data-translate="section_budget_friendly_desc">Quality headphones that won'\''t break the bank.<\/p>/g' "$file"
    
    sed -i 's/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">Under \$100<\/h4>/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2" data-translate="budget_under_100">Under \$100<\/h4>/g' "$file"
    sed -i 's/<p class="text-gray-600 dark:text-gray-300 mb-3">Best value headphones for budget-conscious buyers.<\/p>/<p class="text-gray-600 dark:text-gray-300 mb-3" data-translate="budget_under_100_desc">Best value headphones for budget-conscious buyers.<\/p>/g' "$file"
    sed -i 's/<span class="btn-primary btn-sm">Shop Now →<\/span>/<span class="btn-primary btn-sm" data-translate="btn_shop_now">Shop Now →<\/span>/g' "$file"
    
    sed -i 's/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">Student Budget<\/h4>/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2" data-translate="budget_student">Student Budget<\/h4>/g' "$file"
    sed -i 's/<p class="text-gray-600 dark:text-gray-300 mb-3">Affordable options perfect for students and learners.<\/p>/<p class="text-gray-600 dark:text-gray-300 mb-3" data-translate="budget_student_desc">Affordable options perfect for students and learners.<\/p>/g' "$file"
    
    sed -i 's/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">Long Battery Life<\/h4>/<h4 class="text-lg font-semibold text-gray-900 dark:text-white mb-2" data-translate="budget_long_battery">Long Battery Life<\/h4>/g' "$file"
    sed -i 's/<p class="text-gray-600 dark:text-gray-300 mb-3">Wireless headphones that last all day and night.<\/p>/<p class="text-gray-600 dark:text-gray-300 mb-3" data-translate="budget_long_battery_desc">Wireless headphones that last all day and night.<\/p>/g' "$file"
    
    # Contact section
    sed -i 's/<h3 class="text-2xl font-bold text-gray-900 dark:text-white mb-6">Get in Touch<\/h3>/<h3 class="text-2xl font-bold text-gray-900 dark:text-white mb-6" data-translate="section_get_in_touch">Get in Touch<\/h3>/g' "$file"
    sed -i 's/<p class="text-lg text-gray-600 dark:text-gray-300 mb-8">Have questions or suggestions? We'\''d love to hear from you.<\/p>/<p class="text-lg text-gray-600 dark:text-gray-300 mb-8" data-translate="section_get_in_touch_desc">Have questions or suggestions? We'\''d love to hear from you.<\/p>/g' "$file"
    
    # Form labels
    sed -i 's/<label for="name" class="form-label">Name<\/label>/<label for="name" class="form-label" data-translate="form_name">Name<\/label>/g' "$file"
    sed -i 's/<label for="email" class="form-label">Email<\/label>/<label for="email" class="form-label" data-translate="form_email">Email<\/label>/g' "$file"
    sed -i 's/<label for="message" class="form-label">Message<\/label>/<label for="message" class="form-label" data-translate="form_message">Message<\/label>/g' "$file"
    
    # Form placeholders
    sed -i 's/placeholder="Your name"/placeholder="Your name" data-translate-placeholder="form_name_placeholder"/g' "$file"
    sed -i 's/placeholder="your.email@example.com"/placeholder="your.email@example.com" data-translate-placeholder="form_email_placeholder"/g' "$file"
    sed -i 's/placeholder="Your message here..."/placeholder="Your message here..." data-translate-placeholder="form_message_placeholder"/g' "$file"
    
    # Form button
    sed -i 's/<button type="submit" class="btn-primary">Send Message<\/button>/<button type="submit" class="btn-primary" data-translate="btn_send_message">Send Message<\/button>/g' "$file"
    
    # Contact info
    sed -i 's/<p class="text-gray-600 dark:text-gray-300">Or email us directly at: <a href="mailto:hello@mrheadphones.com" class="text-secondary hover:text-secondary\/80">hello@mrheadphones.com<\/a><\/p>/<p class="text-gray-600 dark:text-gray-300" data-translate="contact_email_text">Or email us directly at: <a href="mailto:hello@mrheadphones.com" class="text-secondary hover:text-secondary\/80">hello@mrheadphones.com<\/a><\/p>/g' "$file"
    
    # Footer
    sed -i 's/<p class="text-gray-300 mb-6">MrHeadphones.com is a user-first headphone discovery platform that helps you find the right pair based on real-world testing, expert research, and audio performance for every need — work, play, and everything in between.<\/p>/<p class="text-gray-300 mb-6" data-translate="footer_description">MrHeadphones.com is a user-first headphone discovery platform that helps you find the right pair based on real-world testing, expert research, and audio performance for every need — work, play, and everything in between.<\/p>/g' "$file"
    
    # Footer links
    sed -i 's/<h3 class="font-heading font-semibold text-lg mb-4">Quick Links<\/h3>/<h3 class="font-heading font-semibold text-lg mb-4" data-translate="footer_quick_links">Quick Links<\/h3>/g' "$file"
    sed -i 's/<h3 class="font-heading font-semibold text-lg mb-4">Connect<\/h3>/<h3 class="font-heading font-semibold text-lg mb-4" data-translate="footer_connect">Connect<\/h3>/g' "$file"
    
    # Footer copyright
    sed -i 's/<p class="text-gray-400 text-sm">© 2025 MrHeadphones.com. All rights reserved.<\/p>/<p class="text-gray-400 text-sm" data-translate="footer_copyright">© 2025 MrHeadphones.com. All rights reserved.<\/p>/g' "$file"
    
    # Mobile menu links
    sed -i 's/<a href="\/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">Home<\/a>/<a href="\/#home" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_home">Home<\/a>/g' "$file"
    sed -i 's/<a href="\/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">Categories<\/a>/<a href="\/#categories" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_categories">Categories<\/a>/g' "$file"
    sed -i 's/<a href="\/#devices" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">Devices<\/a>/<a href="\/#devices" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_devices">Devices<\/a>/g' "$file"
    sed -i 's/<a href="\/#solutions" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">Solutions<\/a>/<a href="\/#solutions" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_solutions">Solutions<\/a>/g' "$file"
    sed -i 's/<a href="\/#budget" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">Budget<\/a>/<a href="\/#budget" class="block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700" data-translate="nav_budget">Budget<\/a>/g' "$file"
    
    # Accessibility attributes
    sed -i 's/aria-label="Toggle dark mode"/aria-label="Toggle dark mode" data-translate-title="dark_mode_toggle"/g' "$file"
    sed -i 's/aria-label="Toggle mobile menu"/aria-label="Toggle mobile menu" data-translate-title="mobile_menu_toggle"/g' "$file"
    
    echo "Added comprehensive translations to: $file"
}

# Process all category directories
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        html_file="$dir/index.html"
        if [ -f "$html_file" ]; then
            add_comprehensive_translations "$html_file"
        fi
    fi
done

# Also process the main index.html file
if [ -f "index.html" ]; then
    add_comprehensive_translations "index.html"
fi

# Process privacy and terms pages
if [ -f "privacy.html" ]; then
    add_comprehensive_translations "privacy.html"
fi

if [ -f "terms.html" ]; then
    add_comprehensive_translations "terms.html"
fi

echo "Comprehensive translation attributes added to all pages!" 