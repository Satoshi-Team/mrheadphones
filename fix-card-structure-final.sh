#!/bin/bash

echo "🔧 Enforcing final card structure on all supporting pages..."

fix_card_structure_final() {
    local file="$1"
    echo "Processing: $file"
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"

    # 1. Ensure card-hover uses flex flex-col h-full
    sed -i 's/class="card-hover\([^"]*\)"/class="card-hover flex flex-col h-full\1"/g' "$file"

    # 2. Ensure grid uses items-stretch h-full
    sed -i 's/class="grid \([^"]*\)"/class="grid items-stretch h-full \1"/g' "$file"

    # 3. Ensure Check Price button is in a div.mt-auto
    # Replace <a ...>Check Price</a> with <div class="mt-auto"><a ...>Check Price</a></div>
    sed -i 's/\(<div class="card-hover[^>]*>\)\(.*\)\(<a [^>]*>Check Price<\/a>\)/\1\2<div class="mt-auto">\3<\/div>/g' "$file"

    # 4. Remove extra wrappers or misplaced closing tags (aggressive cleanup)
    sed -i 's/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g' "$file"
}

# Find all relevant HTML files and apply the fix
find categories/ src/pages/ -name '*.html' | while read -r file; do
    fix_card_structure_final "$file"
done

echo "✅ Card structure fix complete. Please test locally." 