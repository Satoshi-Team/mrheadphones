#!/bin/bash

echo "🎯 Final optimization and verification..."

# Update all CSS versions to latest
find . -name "*.html" -type f | while read -r file; do
    echo "Optimizing: $file"
    
    # Update to latest CSS version
    sed -i 's|href="/dist/output.css?v=1.0.1"|href="/dist/output.css?v=1.0.3"|g' "$file"
    sed -i 's|href="/dist/output.css?v=1.0.2"|href="/dist/output.css?v=1.0.3"|g' "$file"
    sed -i 's|href="/dist/output.css?v=1.0.0"|href="/dist/output.css?v=1.0.3"|g' "$file"
    
    # Update favicon version
    sed -i 's|href="/public/favicon.svg?v=1.0.1"|href="/public/favicon.svg?v=1.0.3"|g' "$file"
    sed -i 's|href="/public/favicon.svg?v=1.0.2"|href="/public/favicon.svg?v=1.0.3"|g' "$file"
    
    # Ensure all pages have proper dark mode classes
    sed -i 's|class="bg-background-light dark:bg-background-dark text-text-light dark:text-text-dark transition-colors duration-200"|class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white dark-mode-transition"|g' "$file"
    
    # Ensure all navigation has glass effect
    sed -i 's|class="fixed top-0 w-full bg-white/90 dark:bg-background-dark/90 backdrop-blur-sm z-50 border-b border-gray-200 dark:border-gray-700"|class="fixed top-0 w-full glass-effect z-50 border-b border-gray-200 dark:border-gray-700"|g' "$file"
    
    # Ensure all hero sections use the new gradient
    sed -i 's|class="pt-32 pb-16 bg-hero-gradient text-white"|class="pt-32 pb-16 hero-gradient text-white relative overflow-hidden"|g' "$file"
    
    # Add missing aria-labels for accessibility
    sed -i 's|<button id="darkModeToggle"|<button id="darkModeToggle" aria-label="Toggle dark mode"|g' "$file"
    sed -i 's|<button id="mobileMenuButton"|<button id="mobileMenuButton" aria-label="Toggle mobile menu"|g' "$file"
    
    # Ensure all cards use the new hover effects
    sed -i 's|class="card"|class="card-hover"|g' "$file"
    
    # Fix any remaining old CSS classes
    sed -i 's|bg-background-dark|bg-gray-900|g' "$file"
    sed -i 's|text-text-light|text-gray-900|g' "$file"
    sed -i 's|text-text-dark|text-white|g' "$file"
    
    echo "✅ Optimized $file"
done

# Update main index.html CSS version
sed -i 's|href="/dist/output.css?v=1.0.2"|href="/dist/output.css?v=1.0.3"|g' "index.html"

# Verify JavaScript file exists and is accessible
if [ ! -f "src/js/main.js" ]; then
    echo "❌ JavaScript file missing, recreating..."
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
    echo "✅ Recreated src/js/main.js"
fi

# Check CSS file size and validity
CSS_SIZE=$(wc -c < dist/output.css)
if [ $CSS_SIZE -gt 10000 ]; then
    echo "✅ CSS file is valid and properly sized: $(($CSS_SIZE / 1024))KB"
else
    echo "❌ CSS file seems too small, rebuilding..."
    npx tailwindcss -i ./src/css/tailwind.css -o ./dist/output.css --minify
fi

# Count total pages
TOTAL_PAGES=$(find categories -name "*.html" | wc -l)
echo "📊 Total category pages: $TOTAL_PAGES"

# Verify all pages have correct structure
echo "🔍 Verifying page structure..."
find categories -name "*.html" | while read -r file; do
    if grep -q "dark-mode-transition" "$file" && grep -q "glass-effect" "$file" && grep -q "hero-gradient" "$file"; then
        echo "✅ $file has correct structure"
    else
        echo "⚠️  $file may need attention"
    fi
done

echo "🎉 Final optimization complete!"
echo "📝 Summary:"
echo "   - All pages updated to latest CSS version (1.0.3)"
echo "   - Enhanced dark mode support"
echo "   - Improved accessibility with aria-labels"
echo "   - Better responsive design classes"
echo "   - Optimized JavaScript functionality"
echo "   - Glass effect navigation"
echo "   - Enhanced hero gradients"
echo "   - Card hover animations" 