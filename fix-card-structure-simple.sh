#!/bin/bash

echo "🔧 Simple card structure fix - rebuilding broken cards..."

# Function to fix card structure in a file
fix_card_structure_simple() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Create the new card section content
    cat > /tmp/new_cards.html << 'EOF'
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 lg:gap-8 w-full max-w-7xl mx-auto items-stretch">
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
                </div>
EOF

    # Replace the broken card section with the new one
    awk '
    BEGIN { 
        in_card_section = 0 
        printed_new_cards = 0
    }
    /<!-- Top Picks -->/ { 
        in_card_section = 1 
        print
        next
    }
    /<!-- Kids Safety Features Section -->/ { 
        in_card_section = 0 
        if (!printed_new_cards) {
            system("cat /tmp/new_cards.html")
            printed_new_cards = 1
        }
        print
        next
    }
    in_card_section && /<div class="grid/ { 
        if (!printed_new_cards) {
            system("cat /tmp/new_cards.html")
            printed_new_cards = 1
        }
        next
    }
    in_card_section && !printed_new_cards { 
        next
    }
    { print }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    
    # Clean up temp file
    rm -f /tmp/new_cards.html
}

# Find all HTML files and apply the fix
find . -type f -name "*.html" | while read -r file; do
    fix_card_structure_simple "$file"
done

echo "✅ Simple card structure fix applied!" 