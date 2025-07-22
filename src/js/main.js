// Dark mode functionality
function initDarkMode() {
  const darkModeToggle = document.getElementById('darkModeToggle');
  const html = document.documentElement;
  
  // Check for saved theme preference or default to light mode
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark' || (!savedTheme && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
    html.classList.add('dark');
  }
  
  // Toggle dark mode
  if (darkModeToggle) {
    darkModeToggle.addEventListener('click', () => {
      html.classList.toggle('dark');
      const isDark = html.classList.contains('dark');
      localStorage.setItem('theme', isDark ? 'dark' : 'light');
    });
  }
}

// Mobile menu functionality
function initMobileMenu() {
  const mobileMenuButton = document.getElementById('mobileMenuButton');
  const mobileMenu = document.getElementById('mobileMenu');
  
  if (mobileMenuButton && mobileMenu) {
    mobileMenuButton.addEventListener('click', () => {
      mobileMenu.classList.toggle('hidden');
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
  initDarkMode();
  initMobileMenu();
  initSmoothScroll();
  initAffiliateTracking();
  initScrollTracking();
  initContactForm();
  initCTATracking();
}); 