#!/bin/bash

echo "🔧 Enforcing uniform card layout across all pages..."

# Function to fix card layout in a file
fix_uniform_card_layout() {
    local file="$1"
    echo "Processing: $file"
    
    # Backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"

    # Ensure .card-hover uses flex flex-col h-full
    sed -i 's/class="card-hover\([^"]*\)"/class="card-hover flex flex-col h-full\1"/g' "$file"

    # Ensure button containers use mt-auto
    sed -i 's/<a \([^>]*\)class="\([^"]*\)btn\([^"]*\)"/<div class="mt-auto"><a \1class="\2btn\3"/g' "$file"
    sed -i 's/<\/a>/&<\/div>/g' "$file"

    # Ensure grid containers are consistent
    sed -i 's/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3[^\"]*"/class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 w-full max-w-7xl mx-auto"/g' "$file"
    sed -i 's/class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6[^\"]*"/class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8 w-full max-w-7xl mx-auto"/g' "$file"

    # Remove any floating or misplaced button containers outside card-hover
    # (This is a best-effort regex, manual review may be needed for edge cases)
    sed -i '/<\/div>\s*<a [^>]*class="[^"]*btn[^"]*"/d' "$file"
}

# Find all HTML files in root, categories, and src/pages
find . \( -name '*.html' \) | while read -r file; do
    fix_uniform_card_layout "$file"
done

echo "✅ Uniform card layout applied to all pages." 