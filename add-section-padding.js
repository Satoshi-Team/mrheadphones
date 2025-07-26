const fs = require('fs');

// Read the current index.html file
let html = fs.readFileSync('index.html', 'utf8');

// Define the sections and their current padding classes
const sections = [
    {
        id: 'categories',
        currentClass: 'py-20',
        newClass: 'py-16 sm:py-20 lg:py-24 xl:py-28'
    },
    {
        id: 'devices',
        currentClass: 'py-20',
        newClass: 'py-16 sm:py-20 lg:py-24 xl:py-28'
    },
    {
        id: 'solutions',
        currentClass: 'py-20',
        newClass: 'py-16 sm:py-20 lg:py-24 xl:py-28'
    },
    {
        id: 'budget',
        currentClass: 'py-20',
        newClass: 'py-16 sm:py-20 lg:py-24 xl:py-28'
    },
    {
        id: 'contact',
        currentClass: 'py-20',
        newClass: 'py-16 sm:py-20 lg:py-24 xl:py-28'
    }
];

// Update each section's padding
sections.forEach(section => {
    // Find the section by ID and update its padding class
    const sectionRegex = new RegExp(`(id="${section.id}"[^>]*class="[^"]*)\\b${section.currentClass}\\b([^"]*")`, 'g');
    html = html.replace(sectionRegex, `$1${section.newClass}$2`);
    
    // Also update any section that might not have the ID but has the class
    const classRegex = new RegExp(`(class="[^"]*)\\b${section.currentClass}\\b([^"]*")`, 'g');
    html = html.replace(classRegex, `$1${section.newClass}$2`);
});

// Add additional spacing between sections by updating the section containers
// Add margin-bottom to the main content containers within sections
html = html.replace(
    /(<div class="content-container[^"]*">)/g,
    '$1'
);

// Add specific spacing improvements for mobile and tablet
// Update the grid containers to have better spacing
html = html.replace(
    /(grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8)/g,
    'grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8 lg:gap-10 xl:gap-12'
);

html = html.replace(
    /(grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 lg:gap-10)/g,
    'grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 sm:gap-10 lg:gap-12 xl:gap-14'
);

html = html.replace(
    /(grid grid-cols-1 md:grid-cols-2 gap-8)/g,
    'grid grid-cols-1 md:grid-cols-2 gap-8 sm:gap-10 lg:gap-12'
);

// Add better spacing for the category cards
html = html.replace(
    /(mb-16)/g,
    'mb-12 sm:mb-16 lg:mb-20'
);

// Add better spacing for the text-center sections
html = html.replace(
    /(text-center mb-16)/g,
    'text-center mb-12 sm:mb-16 lg:mb-20'
);

// Add better spacing for the form container
html = html.replace(
    /(max-w-2xl mx-auto)/g,
    'max-w-2xl mx-auto px-4 sm:px-6 lg:px-8'
);

// Add better spacing for the budget cards
html = html.replace(
    /(category-card group)/g,
    'category-card group p-6 sm:p-8'
);

// Write the updated HTML back to the file
fs.writeFileSync('index.html', html);

console.log('✅ Section padding updated successfully!');
console.log('📱 Responsive padding added for desktop, tablet, and mobile');
console.log('🎯 Better spacing between all major sections'); 