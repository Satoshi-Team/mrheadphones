#!/bin/bash

echo "🔧 Complete card structure fix - fixing broken HTML and layout..."

# Function to fix card structure in a file
fix_card_structure_complete() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix the entire card structure with proper HTML and flexbox layout
    sed -i '
    # Fix the grid container
    s/class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-4 sm:gap-6 lg:gap-8 w-full max-w-7xl mx-auto items-stretch"/class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8 w-full max-w-7xl mx-auto items-stretch"/g
    
    # Fix card structure - replace broken cards with proper structure
    /<!-- Product Card 1 -->/,/<!-- Product Card 2 -->/ {
        /<!-- Product Card 1 -->/ {
            a
                    <!-- Product Card 1 -->
                    <div class="card-hover w-full p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full">
                        <div class="text-center mb-4">
                            <div class="mb-4">
                                <img src="/public/favicon.svg" alt="Headphones Icon" class="w-8 h-8 mx-auto">
                            </div>
                            <h3 class="font-heading font-semibold text-xl mb-3">Puro Sound Labs BT2200</h3>
                            <p class="text-2xl font-bold text-secondary mb-4">$79</p>
                        </div>
                        <div class="space-y-3 mb-6 flex-1">
                            <div class="flex items-start space-x-2">
                                <span class="text-green-500 mt-0.5">✓</span>
                                <span class="text-sm">85dB volume limiting</span>
                            </div>
                            <div class="flex items-start space-x-2">
                                <span class="text-green-500 mt-0.5">✓</span>
                                <span class="text-sm">Durable construction</span>
                            </div>
                            <div class="flex items-start space-x-2">
                                <span class="text-green-500 mt-0.5">✓</span>
                                <span class="text-sm">22+ hour battery life</span>
                            </div>
                            <div class="flex items-start space-x-2">
                                <span class="text-red-500 mt-0.5">✗</span>
                                <span class="text-sm">Limited color options</span>
                            </div>
                        </div>
                        <div class="mt-auto">
                            <a href="https://www.amazon.com/s?k=Puro+Sound+Labs+BT2200+headphones&linkCode=ll2&tag=ngp0ba-20" class="btn-product w-full text-center block" target="_blank" rel="noopener noreferrer">
                                Check Price
                            </a>
                        </div>
                    </div>
        }
        /<!-- Product Card 2 -->/ {
            a
                    <!-- Product Card 2 -->
                    <div class="card-hover w-full p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full">
                        <div class="text-center mb-4">
                            <div class="mb-4">
                                <img src="/public/favicon.svg" alt="Headphones Icon" class="w-8 h-8 mx-auto">
                            </div>
                            <h3 class="font-heading font-semibold text-xl mb-3">JBL JR300BT</h3>
                            <p class="text-2xl font-bold text-secondary mb-4">$49</p>
                        </div>
                        <div class="space-y-3 mb-6 flex-1">
                            <div class="flex items-start space-x-2">
                                <span class="text-green-500 mt-0.5">✓</span>
                                <span class="text-sm">85dB volume limiting</span>
                            </div>
                            <div class="flex items-start space-x-2">
                                <span class="text-green-500 mt-0.5">✓</span>
                                <span class="text-sm">Fun color options</span>
                            </div>
                            <div class="flex items-start space-x-2">
                                <span class="text-green-500 mt-0.5">✓</span>
                                <span class="text-sm">12+ hour battery life</span>
                            </div>
                            <div class="flex items-start space-x-2">
                                <span class="text-red-500 mt-0.5">✗</span>
                                <span class="text-sm">Basic sound quality</span>
                            </div>
                        </div>
                        <div class="mt-auto">
                            <a href="https://www.amazon.com/s?k=JBL+JR300BT+headphones&linkCode=ll2&tag=ngp0ba-20" class="btn-product w-full text-center block" target="_blank" rel="noopener noreferrer">
                                Check Price
                            </a>
                        </div>
                    </div>
        }
        /<!-- Product Card 3 -->/ {
            a
                    <!-- Product Card 3 -->
                    <div class="card-hover w-full p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full">
                        <div class="text-center mb-4">
                            <div class="mb-4">
                                <img src="/public/favicon.svg" alt="Headphones Icon" class="w-8 h-8 mx-auto">
                            </div>
                            <h3 class="font-heading font-semibold text-xl mb-3">CozyPhones Kids</h3>
                            <p class="text-2xl font-bold text-secondary mb-4">$29</p>
                        </div>
                        <div class="space-y-3 mb-6 flex-1">
                            <div class="flex items-start space-x-2">
                                <span class="text-green-500 mt-0.5">✓</span>
                                <span class="text-sm">Soft headband design</span>
                            </div>
                            <div class="flex items-start space-x-2">
                                <span class="text-green-500 mt-0.5">✓</span>
                                <span class="text-sm">Comfortable for sleep</span>
                            </div>
                            <div class="flex items-start space-x-2">
                                <span class="text-green-500 mt-0.5">✓</span>
                                <span class="text-sm">Machine washable</span>
                            </div>
                            <div class="flex items-start space-x-2">
                                <span class="text-red-500 mt-0.5">✗</span>
                                <span class="text-sm">Wired connection only</span>
                            </div>
                        </div>
                        <div class="mt-auto">
                            <a href="https://www.amazon.com/s?k=CozyPhones+Kids+headphones&linkCode=ll2&tag=ngp0ba-20" class="btn-product w-full text-center block" target="_blank" rel="noopener noreferrer">
                                Check Price
                            </a>
                        </div>
                    </div>
        }
    }
    ' "$file"
    
    # Remove all the broken card content between the markers
    awk '
    BEGIN { 
        in_broken_section = 0 
        print_section = 1
    }
    /<!-- Product Card 1 -->/ { 
        in_broken_section = 1 
        print_section = 0
    }
    /<!-- Product Card 2 -->/ { 
        in_broken_section = 1 
        print_section = 0
    }
    /<!-- Product Card 3 -->/ { 
        in_broken_section = 1 
        print_section = 0
    }
    /<!-- Kids Safety Features Section -->/ { 
        in_broken_section = 0 
        print_section = 1
    }
    print_section { print }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
}

# Find all HTML files and apply the fix
find . -type f -name "*.html" | while read -r file; do
    fix_card_structure_complete "$file"
done

echo "✅ Complete card structure fix applied!" 