#!/bin/bash

echo "🔧 Enforcing uniform card layout across all pages..."

fix_card_layout_uniform() {
    local file="$1"
    echo "Processing: $file"
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"

    # Ensure .card-hover has flex flex-col h-full
    sed -i 's/class="card-hover\([^"]*\)"/class="card-hover flex flex-col h-full\1"/g' "$file"

    # Ensure grid parents have items-stretch h-full
    sed -i 's/class="grid \([^"]*\)"/class="grid \1 items-stretch h-full"/g' "$file"

    # Ensure card buttons have mt-auto
    sed -i 's/class="btn btn-primary"/class="btn btn-primary mt-auto"/g' "$file"
    sed -i 's/class="btn btn-primary "/class="btn btn-primary mt-auto "/g' "$file"
}

# Find all relevant HTML files
find . -type f -name '*.html' | while read -r file; do
    fix_card_layout_uniform "$file"
done

echo "✅ Uniform card layout applied to all HTML files." 