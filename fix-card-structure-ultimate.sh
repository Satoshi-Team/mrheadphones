#!/bin/bash

echo "🔧 Ultimate fix for card structure and layout..."

# Function to fix card structure in a file
fix_card_structure_ultimate() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # 1. Add flex flex-col h-full to all .card-hover containers
    sed -i 's/class="card-hover\([^"]*\)"/class="card-hover flex flex-col h-full\1"/g' "$file"
    
    # 2. Ensure Check Price button is inside the card as last child with mt-auto
    # Move any <a ...>Check Price</a> outside .card-hover into the last child inside .card-hover
    awk '
    BEGIN { card_open=0; card_lines=""; }
    /<div class="card-hover/ { card_open=1; card_lines=$0; next }
    card_open {
      card_lines=card_lines "\n" $0
      if ($0 ~ /<\/div>/) {
        card_open=0
        # Move Check Price button inside if found outside
        if (card_lines ~ /<a[^>]*>Check Price<\/a>/ && card_lines !~ /mt-auto/) {
          sub(/<a([^>]*)>Check Price<\/a>/, "<a\\1 mt-auto>Check Price<\/a>", card_lines)
        }
        print card_lines
        card_lines=""
        next
      }
      next
    }
    { print }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    
    # 3. Add items-stretch to all grid containers
    sed -i 's/class="grid \([^"]*\)"/class="grid \1 items-stretch"/g' "$file"
    
    # 4. Remove any floating or orphaned Check Price buttons outside cards
    sed -i '/<a[^>]*>Check Price<\/a>/!b;n;/<\/div>/!b;d' "$file"
}

# Find all relevant HTML files and apply the fix
find . -type f \( -name '*.html' \) | while read -r file; do
  fix_card_structure_ultimate "$file"
done

echo "✅ Ultimate card structure and layout fix complete!" 