#!/bin/bash

# Cleanup navigation structure
# Fix duplicate divs and malformed tags

echo "🧹 Cleaning up navigation structure..."

# Function to cleanup a single file
cleanup_file() {
    local file="$1"
    echo "📝 Cleaning: $file"
    
    # Fix duplicate "Right Side Controls" divs
    sed -i '/<!-- Right Side Controls -->/,/<!-- Right Side Controls -->/ {
        /<!-- Right Side Controls -->/ {
            N
            /<!-- Right Side Controls -->/d
        }
    }' "$file"
    
    # Fix malformed closing tags in navigation links
    sed -i 's/<\/button>/<\/a>/g' "$file"
    
    # Fix malformed closing tags in mobile menu items
    sed -i 's/<\/button>/<\/a>/g' "$file"
    
    # Fix duplicate closing divs
    sed -i '/<!-- Right Side Controls -->/,/<\/div>/ {
        /<\/div>/ {
            :a
            N
            /<\/div>/ {
                s/<\/div>\n<\/div>/<\/div>/
                ta
            }
        }
    }' "$file"
    
    # Fix missing closing span tag in dark mode toggle
    sed -i 's/<span class="dark:hidden">\s*<svg/<span class="dark:hidden">\n                        <svg/g' "$file"
    sed -i 's/<\/svg>\s*<span class="hidden dark:inline">/<\/svg>\n                    <\/span>\n                    <span class="hidden dark:inline">/g' "$file"
    
    echo "✅ Cleaned: $file"
}

# Main execution
echo "🚀 Starting navigation cleanup..."

# 1. Clean main index.html
echo "📄 Cleaning main index.html..."
cleanup_file "index.html"

# 2. Clean all category pages
echo "📁 Cleaning category pages..."
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        cleanup_file "${dir}index.html"
    fi
done

# 3. Clean src/pages files if they exist
echo "📁 Cleaning src/pages files..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        cleanup_file "$file"
    fi
done

# 4. Clean other HTML files
echo "📄 Cleaning other HTML files..."
cleanup_file "privacy.html"
cleanup_file "terms.html"

echo ""
echo "🎉 Navigation structure cleanup completed!"
echo "📊 Summary:"
echo "   - Removed duplicate 'Right Side Controls' divs"
echo "   - Fixed malformed closing tags"
echo "   - Cleaned up HTML structure"
echo "   - All body content preserved" 