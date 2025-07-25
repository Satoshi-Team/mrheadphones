#!/bin/bash

echo "🔧 Standardizing all card-hover elements and grid containers..."

fix_card_structure_uniform() {
    local file="$1"
    echo "Processing: $file"
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"

    # Standardize card-hover: enforce flex-col, h-full, and button in mt-auto
    sed -i 's/class="card-hover\([^"]*\)"/class="card-hover w-full p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 flex flex-col h-full"/g' "$file"

    # Move button inside a div.mt-auto at the end of card-hover
    awk '
    BEGIN { card = ""; in_card = 0 }
    /<div class="card-hover/ { in_card = 1; card = $0; next }
    in_card {
      if ($0 ~ /<a [^>]*>Check Price<\/a>/) {
        card = card "\n  <div class=\"mt-auto\">" $0 "</div>"
      } else if ($0 ~ /<\/div>/) {
        print card
        print $0
        in_card = 0
        card = ""
      } else {
        card = card "\n" $0
      }
      next
    }
    { if (!in_card) print $0 }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"

    # Standardize grid containers
    sed -i 's/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3[^"]*"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 w-full max-w-7xl mx-auto"/g' "$file"
}

# Find all relevant HTML files and apply the fix
find . -type f -name '*.html' | while read -r file; do
    fix_card_structure_uniform "$file"
done

echo "✅ All card-hover elements and grids standardized. Test locally before pushing." 