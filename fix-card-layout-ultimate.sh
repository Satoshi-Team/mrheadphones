#!/bin/bash

echo "🔧 Ultimate fix for card layout and button positioning..."

# Function to fix card layout issues in a file
fix_card_layout_ultimate() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Ensure .card-hover uses flex flex-col h-full
    sed -i 's/class="card-hover\([^"]*\)"/class="card-hover\1 flex flex-col h-full"/g' "$file"
    
    # Add items-stretch to grid containers
    sed -i 's/class="grid \([^"]*\)"/class="grid \1 items-stretch"/g' "$file"
    
    # Wrap Check Price buttons in <div class="mt-auto"> if not already wrapped
    awk '
    BEGIN { in_card = 0 }
    /<div class="card-hover/ { in_card = 1 }
    in_card && /<a [^>]*>Check Price<\/a>/ {
        sub(/(<a [^>]*>Check Price<\/a>)/, "<div class=\"mt-auto\">&</div>")
    }
    /<\/div>/ && in_card { in_card = 0 }
    { print }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
}

# Find all HTML files and apply the fix
find . -type f -name "*.html" | while read -r file; do
    fix_card_layout_ultimate "$file"
done

echo "✅ Ultimate card layout fix complete!" 