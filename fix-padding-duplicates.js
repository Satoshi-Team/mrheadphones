const fs = require('fs');

// Read the current index.html file
let html = fs.readFileSync('index.html', 'utf8');

// Fix duplicate padding classes in sections
const sections = [
    'categories',
    'devices', 
    'solutions',
    'budget',
    'contact'
];

sections.forEach(sectionId => {
    // Find and fix the section with duplicate classes
    const regex = new RegExp(`(id="${sectionId}"[^>]*class="[^"]*)(py-16 sm:py-16 sm:py-16 sm:py-16 sm:py-16 sm:py-16 sm:py-20 lg:py-24 xl:py-28 lg:py-24 xl:py-28 lg:py-24 xl:py-28 lg:py-24 xl:py-28 lg:py-24 xl:py-28 lg:py-24 xl:py-28 lg:py-24 xl:py-28 lg:py-24 xl:py-28)([^"]*")`, 'g');
    html = html.replace(regex, `$1py-16 sm:py-20 lg:py-24 xl:py-28$3`);
    
    // Also fix any other duplicate patterns
    const duplicateRegex = new RegExp(`(py-\\d+\\s+sm:py-\\d+\\s+lg:py-\\d+\\s+xl:py-\\d+\\s+){2,}`, 'g');
    html = html.replace(duplicateRegex, 'py-16 sm:py-20 lg:py-24 xl:py-28');
});

// Fix duplicate margin classes
html = html.replace(/(mb-12 sm:mb-16 lg:mb-20\s+){2,}/g, 'mb-12 sm:mb-16 lg:mb-20 ');

// Fix duplicate text-center classes
html = html.replace(/(text-center mb-12 sm:mb-16 lg:mb-20\s+){2,}/g, 'text-center mb-12 sm:mb-16 lg:mb-20 ');

// Clean up any extra spaces
html = html.replace(/\s+/g, ' ');

// Write the updated HTML back to the file
fs.writeFileSync('index.html', html);

console.log('✅ Duplicate padding classes fixed!');
console.log('🧹 HTML cleaned up and optimized'); 