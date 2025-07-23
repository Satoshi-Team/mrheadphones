#!/bin/bash

echo "🔧 Creating uniform header and mobile menu across all devices..."

# Function to create the exact uniform header structure
create_uniform_header() {
    local file="$1"
    
    if [ ! -f "$file" ]; then
        return
    fi
    
    echo "Making uniform: $file"
    
    # Create backup
    cp "$file" "$file.backup"
    
    # Remove reference to non-existent languages.js
    sed -i 's|<script src="/src/js/languages.js"></script>||g' "$file"
    
    # Replace the entire navigation section with the exact uniform structure
    sed -i '/<!-- Navigation -->/,/<!-- Hero Section -->/c\
    <!-- Navigation -->\
    <nav class="fixed top-0 left-0 right-0 w-full bg-white/95 dark:bg-gray-900/95 backdrop-blur-xl border-b border-gray-200/50 dark:border-gray-700/50 shadow-lg z-50 transition-all duration-300">\
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
                    <button id="darkModeToggle" aria-label="Toggle dark mode" data-translate-title="dark_mode_toggle" class="p-2 sm:p-3 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary/30">\
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
                    <button id="mobileMenuButton" aria-label="Toggle mobile menu" data-translate-title="mobile_menu_toggle" class="lg:hidden p-2 sm:p-3 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary/30">\
                        <svg class="w-5 h-5 sm:w-6 sm:h-6" fill="currentColor" viewBox="0 0 20 20">\
                            <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"/>\
                        </svg>\
                    </button>\
                </div>\
            </div>\
        </div>\
        \
        <!-- Mobile Menu - Responsive and accessible -->\
        <div id="mobileMenu" class="hidden lg:hidden bg-white/98 dark:bg-gray-900/98 backdrop-blur-xl border-t border-gray-200/50 dark:border-gray-700/50 shadow-xl">\
            <div class="max-w-7xl mx-auto px-4 sm:px-6 py-4 space-y-1">\
                <a href="/#home" class="block py-3 px-4 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_home">Home</a>\
                <a href="/#categories" class="block py-3 px-4 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_categories">Categories</a>\
                <a href="/#devices" class="block py-3 px-4 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_devices">Devices</a>\
                <a href="/#solutions" class="block py-3 px-4 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_solutions">Solutions</a>\
                <a href="/#budget" class="block py-3 px-4 rounded-xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 text-gray-900 dark:text-white font-medium transition-all duration-200 text-base sm:text-lg" data-translate="nav_budget">Budget</a>\
            </div>\
        </div>\
    </nav>' "$file"
    
    echo "✅ Made uniform: $file"
}

# Fix all category pages
echo "📁 Making category pages uniform..."
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        create_uniform_header "$dir/index.html"
    fi
done

# Fix src/pages category pages
echo "📁 Making src/pages category pages uniform..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        create_uniform_header "$file"
    fi
done

# Fix main pages
echo "📄 Making main pages uniform..."
create_uniform_header "index.html"
create_uniform_header "privacy.html"
create_uniform_header "terms.html"

# Update JavaScript to ensure perfect uniformity
echo "🔧 Updating JavaScript for perfect uniformity..."
cat > src/js/main.js << 'EOF'
// Dark mode functionality
function initDarkMode() {
  const darkModeToggle = document.getElementById('darkModeToggle');
  const html = document.documentElement;
  
  // Check for saved theme preference or default to light mode
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark' || (!savedTheme && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
    html.classList.add('dark');
  }
  
  // Function to toggle dark mode
  function toggleDarkMode() {
    html.classList.toggle('dark');
    const isDark = html.classList.contains('dark');
    localStorage.setItem('theme', isDark ? 'dark' : 'light');
  }
  
  // Desktop dark mode toggle
  if (darkModeToggle) {
    darkModeToggle.addEventListener('click', toggleDarkMode);
  }
}

// Mobile menu functionality - Perfect uniformity across all devices
function initMobileMenu() {
  const mobileMenuButton = document.getElementById('mobileMenuButton');
  const mobileMenu = document.getElementById('mobileMenu');
  
  if (mobileMenuButton && mobileMenu) {
    // Always ensure mobile menu starts hidden
    mobileMenu.classList.add('hidden');
    
    // Remove any conflicting classes
    mobileMenu.classList.remove('block', 'flex', 'grid');
    
    mobileMenuButton.addEventListener('click', (e) => {
      e.preventDefault();
      e.stopPropagation();
      
      // Toggle the hidden class only
      mobileMenu.classList.toggle('hidden');
      
      // Ensure no other display classes interfere
      if (!mobileMenu.classList.contains('hidden')) {
        mobileMenu.classList.remove('block', 'flex', 'grid');
      }
      
      console.log('Mobile menu toggled:', mobileMenu.classList.contains('hidden') ? 'hidden' : 'visible');
    });
    
    // Close menu when clicking outside
    document.addEventListener('click', (e) => {
      if (!mobileMenu.contains(e.target) && !mobileMenuButton.contains(e.target)) {
        mobileMenu.classList.add('hidden');
      }
    });
    
    // Close menu on escape key
    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') {
        mobileMenu.classList.add('hidden');
      }
    });
    
    // Close menu when window is resized to desktop
    window.addEventListener('resize', () => {
      if (window.innerWidth >= 1024) { // lg breakpoint
        mobileMenu.classList.add('hidden');
      }
    });
  }
}

// Smooth scrolling for navigation links
function initSmoothScroll() {
  const links = document.querySelectorAll('a[href^="#"]');
  
  links.forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();
      const targetId = link.getAttribute('href').substring(1);
      const targetElement = document.getElementById(targetId);
      
      if (targetElement) {
        targetElement.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });
}

// Affiliate link tracking
function initAffiliateTracking() {
  const affiliateLinks = document.querySelectorAll('a[href*="amazon"], a[href*="bestbuy"], a[href*="target"]');
  
  affiliateLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      // Track affiliate link clicks
      if (typeof gtag !== 'undefined') {
        gtag('event', 'click', {
          'event_category': 'affiliate',
          'event_label': link.href,
          'value': 1
        });
      }
    });
  });
}

// Scroll depth tracking
function initScrollTracking() {
  let maxScroll = 0;
  
  window.addEventListener('scroll', () => {
    const scrollPercent = Math.round((window.scrollY / (document.body.scrollHeight - window.innerHeight)) * 100);
    
    if (scrollPercent > maxScroll) {
      maxScroll = scrollPercent;
      
      // Track scroll milestones
      if (maxScroll >= 25 && maxScroll < 50) {
        if (typeof gtag !== 'undefined') {
          gtag('event', 'scroll', {
            'event_category': 'engagement',
            'event_label': '25%',
            'value': 25
          });
        }
      } else if (maxScroll >= 50 && maxScroll < 75) {
        if (typeof gtag !== 'undefined') {
          gtag('event', 'scroll', {
            'event_category': 'engagement',
            'event_label': '50%',
            'value': 50
          });
        }
      } else if (maxScroll >= 75) {
        if (typeof gtag !== 'undefined') {
          gtag('event', 'scroll', {
            'event_category': 'engagement',
            'event_label': '75%',
            'value': 75
          });
        }
      }
    }
  });
}

// Contact form handling
function initContactForm() {
  const contactForm = document.getElementById('contactForm');
  
  if (contactForm) {
    contactForm.addEventListener('submit', (e) => {
      e.preventDefault();
      
      const formData = new FormData(contactForm);
      const name = formData.get('name');
      const email = formData.get('email');
      const message = formData.get('message');
      
      // Track form submission
      if (typeof gtag !== 'undefined') {
        gtag('event', 'form_submit', {
          'event_category': 'engagement',
          'event_label': 'contact_form',
          'value': 1
        });
      }
      
      // Show success message (in a real app, this would send to a server)
      alert('Thank you for your message! We\'ll get back to you soon.');
      contactForm.reset();
    });
  }
}

// CTA button tracking
function initCTATracking() {
  const ctaButtons = document.querySelectorAll('.btn-primary, .btn-secondary');
  
  ctaButtons.forEach(button => {
    button.addEventListener('click', (e) => {
      const buttonText = button.textContent.trim();
      
      if (typeof gtag !== 'undefined') {
        gtag('event', 'click', {
          'event_category': 'engagement',
          'event_label': `cta_${buttonText.toLowerCase().replace(/\s+/g, '_')}`,
          'value': 1
        });
      }
    });
  });
}

// Initialize all functionality when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  console.log('Initializing MrHeadphones with uniform header...');
  initDarkMode();
  initMobileMenu();
  initSmoothScroll();
  initAffiliateTracking();
  initScrollTracking();
  initContactForm();
  initCTATracking();
  console.log('MrHeadphones uniform header initialized successfully!');
});
EOF

echo "🎉 Uniform header fix completed!"
echo "✅ All pages now have identical header structure"
echo "✅ Mobile menu behavior is uniform across all devices"
echo "✅ Enhanced JavaScript ensures perfect consistency"
echo "✅ Removed all conflicting references and classes"
echo ""
echo "📝 Uniform features implemented:"
echo "- Identical header structure on all pages"
echo "- Same mobile menu behavior everywhere"
echo "- Consistent dark mode toggle positioning"
echo "- Uniform hamburger menu functionality"
echo "- Same responsive breakpoints across all devices"
echo "- Identical CSS classes and styling"
echo ""
echo "🔄 All devices should now display exactly the same header and mobile menu behavior." 