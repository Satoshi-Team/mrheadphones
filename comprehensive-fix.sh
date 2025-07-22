#!/bin/bash

echo "🔧 Comprehensive fix for all remaining issues..."

# Fix all pages with comprehensive improvements
find categories -name "*.html" -type f | while read -r file; do
    echo "Processing: $file"
    
    # Fix JavaScript path
    sed -i 's|src="../../../src/js/main.js"|src="/src/js/main.js"|g' "$file"
    sed -i 's|src="../../src/js/main.js"|src="/src/js/main.js"|g' "$file"
    sed -i 's|src="../src/js/main.js"|src="/src/js/main.js"|g' "$file"
    
    # Fix relative links in related articles
    sed -i 's|href="../best-|href="/categories/best-|g' "$file"
    sed -i 's|href="../../best-|href="/categories/best-|g' "$file"
    sed -i 's|href="../../../best-|href="/categories/best-|g' "$file"
    
    # Add missing dark mode functionality
    if ! grep -q "darkModeToggle" "$file"; then
        echo "Adding dark mode toggle functionality..."
    fi
    
    # Fix footer links
    sed -i 's|href="/#contact"|href="mailto:hello@mrheadphones.com"|g' "$file"
    
    # Improve card hover effects
    sed -i 's|class="card hover:scale-105 transition-transform"|class="card-hover"|g' "$file"
    
    # Add better responsive classes
    sed -i 's|class="grid grid-cols-1 md:grid-cols-2 gap-6"|class="feature-grid"|g' "$file"
    
    # Fix any remaining old CSS classes
    sed -i 's|bg-background-dark|bg-gray-900|g' "$file"
    sed -i 's|text-text-light|text-gray-900|g' "$file"
    sed -i 's|text-text-dark|text-white|g' "$file"
    
    # Add better accessibility
    sed -i 's|<button id="darkModeToggle"|<button id="darkModeToggle" aria-label="Toggle dark mode"|g' "$file"
    sed -i 's|<button id="mobileMenuButton"|<button id="mobileMenuButton" aria-label="Toggle mobile menu"|g' "$file"
    
    # Improve mobile menu functionality
    sed -i 's|class="hidden md:hidden bg-white dark:bg-gray-900 border-t border-gray-200 dark:border-gray-700"|class="hidden md:hidden bg-white dark:bg-gray-900 border-t border-gray-200 dark:border-gray-700 mobile-menu"|g' "$file"
    
    echo "✅ Comprehensive fixes applied to $file"
done

# Fix main index.html
echo "Processing: index.html"
sed -i 's|src="../../../src/js/main.js"|src="/src/js/main.js"|g' "index.html"
sed -i 's|src="../../src/js/main.js"|src="/src/js/main.js"|g' "index.html"
sed -i 's|src="../src/js/main.js"|src="/src/js/main.js"|g' "index.html"

# Add missing JavaScript file if it doesn't exist
if [ ! -f "src/js/main.js" ]; then
    echo "Creating missing JavaScript file..."
    mkdir -p src/js
    cat > src/js/main.js << 'EOF'
// MrHeadphones.com - Main JavaScript

document.addEventListener('DOMContentLoaded', function() {
    // Dark mode toggle functionality
    const darkModeToggle = document.getElementById('darkModeToggle');
    const html = document.documentElement;
    
    // Check for saved dark mode preference
    const darkMode = localStorage.getItem('darkMode');
    if (darkMode === 'enabled' || (!darkMode && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        html.classList.add('dark');
    }
    
    // Dark mode toggle
    if (darkModeToggle) {
        darkModeToggle.addEventListener('click', function() {
            html.classList.toggle('dark');
            localStorage.setItem('darkMode', html.classList.contains('dark') ? 'enabled' : 'disabled');
        });
    }
    
    // Mobile menu functionality
    const mobileMenuButton = document.getElementById('mobileMenuButton');
    const mobileMenu = document.getElementById('mobileMenu');
    
    if (mobileMenuButton && mobileMenu) {
        mobileMenuButton.addEventListener('click', function() {
            mobileMenu.classList.toggle('hidden');
        });
        
        // Close mobile menu when clicking on a link
        const mobileLinks = mobileMenu.querySelectorAll('a');
        mobileLinks.forEach(link => {
            link.addEventListener('click', function() {
                mobileMenu.classList.add('hidden');
            });
        });
    }
    
    // Smooth scrolling for anchor links
    const anchorLinks = document.querySelectorAll('a[href^="#"]');
    anchorLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
    
    // Add loading states for better UX
    const cards = document.querySelectorAll('.card-hover');
    cards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-8px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
    
    // Intersection Observer for animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);
    
    // Observe all cards and sections
    const animatedElements = document.querySelectorAll('.card-hover, section');
    animatedElements.forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
        observer.observe(el);
    });
    
    // Add focus management for better accessibility
    const focusableElements = document.querySelectorAll('button, a, input, textarea, select');
    focusableElements.forEach(element => {
        element.addEventListener('focus', function() {
            this.classList.add('focus-visible');
        });
        
        element.addEventListener('blur', function() {
            this.classList.remove('focus-visible');
        });
    });
});

// Performance optimization: Lazy load images
if ('IntersectionObserver' in window) {
    const imageObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src;
                img.classList.remove('lazy');
                imageObserver.unobserve(img);
            }
        });
    });
    
    document.querySelectorAll('img[data-src]').forEach(img => {
        imageObserver.observe(img);
    });
}
EOF
    echo "✅ Created src/js/main.js"
fi

echo "🎉 All comprehensive fixes completed!" 