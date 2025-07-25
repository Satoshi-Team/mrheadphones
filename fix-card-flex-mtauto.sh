#!/bin/bash

echo "🔧 Ensuring all card containers use flex flex-col h-full and 'Check Price' buttons are wrapped in mt-auto..."

# Function to fix card structure in a file
fix_card_flex_mtauto() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Ensure .card-hover and .card containers use flex flex-col h-full
    sed -i 's/class="\(card-hover[^"]*\)"/class="\1 flex flex-col h-full"/g' "$file"
    sed -i 's/class="\(card [^"]*\)"/class="\1 flex flex-col h-full"/g' "$file"
    
    # Wrap Check Price button in div.mt-auto if not already
    awk '
    BEGIN { in_card = 0 }
    /<div class="card-hover/ { in_card = 1 }
    in_card && /<a [^>]*>Check Price<\/a>/ {
        print "<div class=\"mt-auto\">" $0 "</div>"
        next
    }
    /<\/div>/ { in_card = 0 }
    { print }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    
    # Ensure grid containers use grid-cols-1 md:grid-cols-2 lg:grid-cols-3 for product cards
    sed -i 's/class="grid grid-cols-[0-9]* md:grid-cols-[0-9]* lg:grid-cols-[0-9]* gap-[0-9]*[ a-z:-]*"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 w-full max-w-7xl mx-auto"/g' "$file"
}

# Find all relevant HTML files and apply the fix
find categories/ src/pages/ -name '*.html' | while read -r file; do
    fix_card_flex_mtauto "$file"
done

echo "✅ All card containers and buttons updated." 