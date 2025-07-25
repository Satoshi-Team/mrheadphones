#!/bin/bash

echo "🔧 Fixing all supporting pages card structures..."

# Function to fix card structures in a file
fix_card_structures() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Fix device cards (similar to homepage Device Integration section)
    # Pattern: <a href="..." class="card ..."> with <div class="mb-3"> and <h3> inside
    sed -i 's/\(<a href="[^"]*" class="card[^>]*>\s*<div class="mb-3">\s*<svg[^>]*><\/svg>\s*\)<h3/\1<\/div>\n                    <h3/g' "$file"
    
    # Fix card-hover elements that are missing closing div tags
    sed -i 's/\(<div class="card-hover">\s*<h3[^>]*>[^<]*<\/h3>\s*<p[^>]*>[^<]*<\/p>\s*<a[^>]*>[^<]*<\/a>\)/\1<\/div>/g' "$file"
    
    # Fix missing closing div tags for content containers
    sed -i 's/\(<div class="text-center mb-16 content-container">\s*<h2[^>]*>[^<]*<\/h2>\s*<p[^>]*>[^<]*<\/p>\)/\1<\/div>/g' "$file"
    
    # Fix missing closing div tags for form elements
    sed -i 's/\(<div>\s*<label[^>]*>[^<]*<\/label>\s*<input[^>]*>\)/\1<\/div>/g' "$file"
    sed -i 's/\(<div>\s*<label[^>]*>[^<]*<\/label>\s*<textarea[^>]*>[^<]*<\/textarea>\)/\1<\/div>/g' "$file"
    
    # Remove duplicate gap classes
    sed -i 's/gap-8 gap-8/gap-8/g' "$file"
    sed -i 's/gap-6 gap-8 gap-8/gap-8/g' "$file"
    
    # Fix contact form grid gap class
    sed -i 's/\(<div class="grid grid-cols-1 md:grid-cols-2 gap-6 gap-8">\)/<div class="grid grid-cols-1 md:grid-cols-2 gap-6">/g' "$file"
    
    # Remove excessive closing div tags (more than 3 consecutive)
    sed -i 's/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g' "$file"
    sed -i 's/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g' "$file"
    sed -i 's/<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n<\/div>\n<\/div>/g' "$file"
    
    # Fix missing closing divs for hero section button container
    sed -i 's/\(<div class="flex flex-col sm:flex-row gap-4 justify-center">\s*<a[^>]*>[^<]*<\/a>\s*<a[^>]*>[^<]*<\/a>\)/\1<\/div>/g' "$file"
    
    echo "✅ Fixed: $file"
}

# Fix all category pages
echo "📁 Processing category pages..."
for file in categories/*/index.html; do
    if [ -f "$file" ]; then
        fix_card_structures "$file"
    fi
done

# Fix all src/pages files
echo "📁 Processing src/pages files..."
for file in src/pages/**/*.html; do
    if [ -f "$file" ]; then
        fix_card_structures "$file"
    fi
done

# Fix main pages
echo "📁 Processing main pages..."
for file in privacy.html terms.html; do
    if [ -f "$file" ]; then
        fix_card_structures "$file"
    fi
done

echo "🎉 All supporting pages have been fixed!"
echo "📋 Summary of fixes applied:"
echo "   - Fixed device card structures (proper <a>...</a> blocks)"
echo "   - Fixed card-hover elements (added missing closing divs)"
echo "   - Fixed content containers (added missing closing divs)"
echo "   - Fixed form elements (added missing closing divs)"
echo "   - Removed duplicate gap classes"
echo "   - Removed excessive closing div tags"
echo "   - Fixed hero section button containers"

echo ""
echo "🔍 Next steps:"
echo "   1. Test the homepage Device Integration section"
echo "   2. Test a few category pages to verify card layouts"
echo "   3. If everything looks good, commit and push the changes" 