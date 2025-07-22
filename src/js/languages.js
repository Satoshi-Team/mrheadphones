// Language configuration for MrHeadphones.com
const LANGUAGES = {
  en: {
    code: 'en',
    name: 'English',
    flag: '🇬🇧',
    flagCode: 'gb',
    locale: 'en-GB',
    direction: 'ltr'
  },
  fr: {
    code: 'fr',
    name: 'Français',
    flag: '🇫🇷',
    flagCode: 'fr',
    locale: 'fr-FR',
    direction: 'ltr'
  },
  de: {
    code: 'de',
    name: 'Deutsch',
    flag: '🇩🇪',
    flagCode: 'de',
    locale: 'de-DE',
    direction: 'ltr'
  },
  it: {
    code: 'it',
    name: 'Italiano',
    flag: '🇮🇹',
    flagCode: 'it',
    locale: 'it-IT',
    direction: 'ltr'
  },
  nl: {
    code: 'nl',
    name: 'Nederlands',
    flag: '🇳🇱',
    flagCode: 'nl',
    locale: 'nl-NL',
    direction: 'ltr'
  },
  pl: {
    code: 'pl',
    name: 'Polski',
    flag: '🇵🇱',
    flagCode: 'pl',
    locale: 'pl-PL',
    direction: 'ltr'
  },
  es: {
    code: 'es',
    name: 'Español',
    flag: '🇪🇸',
    flagCode: 'es',
    locale: 'es-ES',
    direction: 'ltr'
  },
  sv: {
    code: 'sv',
    name: 'Svenska',
    flag: '🇸🇪',
    flagCode: 'se',
    locale: 'sv-SE',
    direction: 'ltr'
  },
  ru: {
    code: 'ru',
    name: 'Русский',
    flag: '🇷🇺',
    flagCode: 'ru',
    locale: 'ru-RU',
    direction: 'ltr'
  },
  uk: {
    code: 'uk',
    name: 'Українська',
    flag: '🇺🇦',
    flagCode: 'ua',
    locale: 'uk-UA',
    direction: 'ltr'
  },
  zh: {
    code: 'zh',
    name: '中文',
    flag: '🇨🇳',
    flagCode: 'cn',
    locale: 'zh-CN',
    direction: 'ltr'
  },
  ja: {
    code: 'ja',
    name: '日本語',
    flag: '🇯🇵',
    flagCode: 'jp',
    locale: 'ja-JP',
    direction: 'ltr'
  },
  ko: {
    code: 'ko',
    name: '한국어',
    flag: '🇰🇷',
    flagCode: 'kr',
    locale: 'ko-KR',
    direction: 'ltr'
  }
};

// Default language
const DEFAULT_LANGUAGE = 'en';

// Get current language from URL or localStorage
function getCurrentLanguage() {
  const urlParams = new URLSearchParams(window.location.search);
  const langFromUrl = urlParams.get('lang');
  
  if (langFromUrl && LANGUAGES[langFromUrl]) {
    localStorage.setItem('mrheadphones_lang', langFromUrl);
    return langFromUrl;
  }
  
  const savedLang = localStorage.getItem('mrheadphones_lang');
  if (savedLang && LANGUAGES[savedLang]) {
    return savedLang;
  }
  
  // Detect browser language
  const browserLang = navigator.language.split('-')[0];
  if (LANGUAGES[browserLang]) {
    return browserLang;
  }
  
  return DEFAULT_LANGUAGE;
}

// Set language
function setLanguage(langCode) {
  if (!LANGUAGES[langCode]) {
    console.error('Unsupported language:', langCode);
    return;
  }
  
  localStorage.setItem('mrheadphones_lang', langCode);
  
  // Update URL without reloading the page
  const url = new URL(window.location);
  url.searchParams.set('lang', langCode);
  window.history.replaceState({}, '', url);
  
  // Load translations and update content
  loadTranslations(langCode);
}

// Load translations for the specified language
async function loadTranslations(langCode) {
  try {
    const response = await fetch(`/translations/${langCode}.json`);
    if (!response.ok) {
      console.warn(`Translation file not found for ${langCode}, falling back to English`);
      const fallbackResponse = await fetch('/translations/en.json');
      if (!fallbackResponse.ok) {
        console.error('Fallback translation file not found');
        return;
      }
      const fallbackTranslations = await fallbackResponse.json();
      updatePageContent(fallbackTranslations);
      return;
    }
    
    const translations = await response.json();
    updatePageContent(translations);
  } catch (error) {
    console.error('Error loading translations:', error);
  }
}

// Update page content with translations
function updatePageContent(translations) {
  // Update all elements with data-translate attribute
  document.querySelectorAll('[data-translate]').forEach(element => {
    const key = element.getAttribute('data-translate');
    if (translations[key]) {
      element.textContent = translations[key];
    }
  });
  
  // Update all elements with data-translate-placeholder attribute
  document.querySelectorAll('[data-translate-placeholder]').forEach(element => {
    const key = element.getAttribute('data-translate-placeholder');
    if (translations[key]) {
      element.placeholder = translations[key];
    }
  });
  
  // Update all elements with data-translate-title attribute
  document.querySelectorAll('[data-translate-title]').forEach(element => {
    const key = element.getAttribute('data-translate-title');
    if (translations[key]) {
      element.title = translations[key];
    }
  });
  
  // Update meta tags
  if (translations.meta_title) {
    document.title = translations.meta_title;
  }
  
  if (translations.meta_description) {
    const metaDesc = document.querySelector('meta[name="description"]');
    if (metaDesc) {
      metaDesc.setAttribute('content', translations.meta_description);
    }
  }
  
  // Update document direction for RTL languages
  const currentLang = getCurrentLanguage();
  if (LANGUAGES[currentLang] && LANGUAGES[currentLang].direction === 'rtl') {
    document.documentElement.dir = 'rtl';
  } else {
    document.documentElement.dir = 'ltr';
  }
}

// Create language dropdown
function createLanguageDropdown() {
  const currentLang = getCurrentLanguage();
  const currentLangData = LANGUAGES[currentLang];
  
  const dropdown = document.createElement('div');
  dropdown.className = 'relative inline-block text-left';
  dropdown.innerHTML = `
    <button id="languageDropdown" class="inline-flex items-center justify-center w-full px-3 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-600 rounded-lg shadow-sm hover:bg-gray-50 dark:hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-secondary focus:ring-offset-2 dark:focus:ring-offset-gray-800 transition-colors duration-200" type="button">
      <span class="mr-2">${currentLangData.flag}</span>
      <span class="hidden sm:inline">${currentLangData.name}</span>
      <svg class="w-4 h-4 ml-2" fill="currentColor" viewBox="0 0 20 20">
        <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
      </svg>
    </button>
    <div id="languageDropdownMenu" class="hidden absolute right-0 mt-2 w-56 rounded-md shadow-lg bg-white dark:bg-gray-800 ring-1 ring-black ring-opacity-5 z-50">
      <div class="py-1" role="menu" aria-orientation="vertical">
        ${Object.entries(LANGUAGES).map(([code, lang]) => `
          <button class="w-full text-left px-4 py-2 text-sm text-gray-700 dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 flex items-center ${code === currentLang ? 'bg-gray-100 dark:bg-gray-700' : ''}" role="menuitem" onclick="setLanguage('${code}')">
            <span class="mr-3">${lang.flag}</span>
            <span>${lang.name}</span>
          </button>
        `).join('')}
      </div>
    </div>
  `;
  
  return dropdown;
}

// Initialize language system
function initLanguageSystem() {
  // Add language dropdown to navigation
  const nav = document.querySelector('nav .content-container-wide .flex.justify-between');
  if (nav) {
    const languageDropdown = createLanguageDropdown();
    nav.appendChild(languageDropdown);
    
    // Add event listeners for dropdown toggle
    const dropdownButton = document.getElementById('languageDropdown');
    const dropdownMenu = document.getElementById('languageDropdownMenu');
    
    if (dropdownButton && dropdownMenu) {
      dropdownButton.addEventListener('click', () => {
        dropdownMenu.classList.toggle('hidden');
      });
      
      // Close dropdown when clicking outside
      document.addEventListener('click', (event) => {
        if (!dropdownButton.contains(event.target) && !dropdownMenu.contains(event.target)) {
          dropdownMenu.classList.add('hidden');
        }
      });
    }
  }
  
  // Load translations for current language
  const currentLang = getCurrentLanguage();
  loadTranslations(currentLang);
}

// Export functions for use in other scripts
window.LanguageSystem = {
  LANGUAGES,
  getCurrentLanguage,
  setLanguage,
  loadTranslations,
  updatePageContent,
  createLanguageDropdown,
  initLanguageSystem
};

// Initialize when DOM is loaded
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initLanguageSystem);
} else {
  initLanguageSystem();
} 