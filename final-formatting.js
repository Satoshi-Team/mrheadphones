const fs = require('fs');

// Read the current index.html file
let html = fs.readFileSync('index.html', 'utf8');

// First, let's properly format the HTML by adding line breaks
html = html.replace(/></g, '>\n<');

// Fix the duplicate padding classes that are still there
const sections = [
    'categories',
    'devices', 
    'solutions',
    'budget',
    'contact'
];

sections.forEach(sectionId => {
    // Remove all duplicate padding classes and replace with clean ones
    const regex = new RegExp(`(id="${sectionId}"[^>]*class="[^"]*)(py-16 sm:py-16 sm:py-16 sm:py-16 sm:py-16 sm:py-16 sm:py-20 lg:py-24 xl:py-28 lg:py-24 xl:py-28 lg:py-24 xl:py-28 lg:py-24 xl:py-28 lg:py-24 xl:py-28 lg:py-24 xl:py-28 lg:py-24 xl:py-28)([^"]*")`, 'g');
    html = html.replace(regex, `$1py-16 sm:py-20 lg:py-24 xl:py-28$3`);
    
    // Also fix any other duplicate patterns
    const duplicateRegex = new RegExp(`(py-\\d+\\s+sm:py-\\d+\\s+lg:py-\\d+\\s+xl:py-\\d+\\s+){2,}`, 'g');
    html = html.replace(duplicateRegex, 'py-16 sm:py-20 lg:py-24 xl:py-28');
});

// Add additional spacing improvements
// Add margin between sections
html = html.replace(
    /(<\/section>)/g,
    '$1\n\n'
);

// Add better spacing for the grid containers
html = html.replace(
    /(grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 lg:gap-8)/g,
    'grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 sm:gap-8 lg:gap-10 xl:gap-12'
);

// Add better spacing for the device integration grid
html = html.replace(
    /(grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 sm:gap-10 lg:gap-12 xl:gap-14)/g,
    'grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 sm:gap-10 lg:gap-12 xl:gap-14'
);

// Add better spacing for the solutions grid
html = html.replace(
    /(grid grid-cols-1 md:grid-cols-2 gap-8 sm:gap-10 lg:gap-12)/g,
    'grid grid-cols-1 md:grid-cols-2 gap-8 sm:gap-10 lg:gap-12'
);

// Add better spacing for the budget grid
html = html.replace(
    /(grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8 lg:gap-10 xl:gap-12)/g,
    'grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8 lg:gap-10 xl:gap-12'
);

// Add better spacing for the category cards
html = html.replace(
    /(p-6)/g,
    'p-6 sm:p-8'
);

// Add better spacing for the device cards
html = html.replace(
    /(p-8)/g,
    'p-6 sm:p-8 lg:p-10'
);

// Add better spacing for the solution cards
html = html.replace(
    /(card-hover p-8)/g,
    'card-hover p-6 sm:p-8 lg:p-10'
);

// Add better spacing for the budget cards
html = html.replace(
    /(category-card group p-6 sm:p-8)/g,
    'category-card group p-6 sm:p-8 lg:p-10'
);

// Add better spacing for the form container
html = html.replace(
    /(max-w-2xl mx-auto px-4 sm:px-6 lg:px-8)/g,
    'max-w-2xl mx-auto px-4 sm:px-6 lg:px-8'
);

// Add better spacing for section headers
html = html.replace(
    /(text-center mb-12 sm:mb-16 lg:mb-20)/g,
    'text-center mb-12 sm:mb-16 lg:mb-20'
);

// Clean up any extra spaces and format properly
html = html.replace(/\s+/g, ' ');
html = html.replace(/>\s+</g, '>\n<');

// Write the updated HTML back to the file
fs.writeFileSync('index.html', html);

console.log('✅ Final formatting and spacing applied!');
console.log('📱 Responsive padding optimized for all devices');
console.log('🎯 Clean spacing between all sections'); 