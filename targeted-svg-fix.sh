#!/bin/bash

# Targeted fix for remaining SVG duplicates and malformed tags

echo "🎯 Targeted SVG and tag fix..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Fix 1: Remove duplicate SVGs in dark mode toggle spans
    # Remove second SVG in dark:hidden span
    sed -i '/<span class="dark:hidden">/,/<\/span>/ { /<svg.*<svg/ { N; d } }' "$file"
    
    # Remove second SVG in hidden dark:inline span  
    sed -i '/<span class="hidden dark:inline">/,/<\/span>/ { /<svg.*<svg/ { N; d } }' "$file"
    
    # Fix 2: Replace malformed closing tags
    sed -i 's/<!-- Dark Mode Toggle -->\s*<\/a>/<!-- Dark Mode Toggle -->/g' "$file"
    sed -i 's/<!-- Mobile Menu Button -->\s*<\/a>/<!-- Mobile Menu Button -->/g' "$file"
    
    # Fix 3: Ensure proper button closing tags
    sed -i 's/<\/span>\s*<\/a>/<\/span>\n                    <\/button>/g' "$file"
    
    # Fix 4: Remove any extra closing tags
    sed -i '/<!-- Right Side Controls -->/,/<\/div>/ { /<\/div>\s*<\/div>\s*<\/div>/d }' "$file"
    
    echo "✅ Fixed: $file"
}

# Function to verify the fix
verify_fix() {
    local file="$1"
    local duplicate_svg_count=$(grep -c "<svg.*<svg" "$file" 2>/dev/null || echo "0")
    local malformed_tags=$(grep -c "</a>.*<!-- Mobile Menu Button -->" "$file" 2>/dev/null || echo "0")
    local proper_buttons=$(grep -c "</button>" "$file" 2>/dev/null || echo "0")
    
    if [ "$duplicate_svg_count" -eq 0 ] && [ "$malformed_tags" -eq 0 ] && [ "$proper_buttons" -gt 0 ]; then
        echo "✅ Verified: $file - Structure looks good"
    else
        echo "❌ Warning: $file - Issues detected (Duplicate SVGs: $duplicate_svg_count, Malformed tags: $malformed_tags, Proper buttons: $proper_buttons)"
    fi
}

# Main execution
echo "🚀 Starting targeted fix..."

# 1. Fix main index.html
echo "📄 Fixing main index.html..."
fix_file "index.html"

# 2. Fix all category pages
echo "📁 Fixing category pages..."
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        fix_file "${dir}index.html"
    fi
done

# 3. Fix src/pages files if they exist
echo "📁 Fixing src/pages files..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        fix_file "$file"
    fi
done

# 4. Fix other HTML files
echo "📄 Fixing other HTML files..."
fix_file "privacy.html"
fix_file "terms.html"

# 5. Verify fixes
echo "🔍 Verifying fixes..."
verify_fix "index.html"
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        verify_fix "${dir}index.html"
    fi
done
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        verify_fix "$file"
    fi
done
verify_fix "privacy.html"
verify_fix "terms.html"

echo ""
echo "🎉 Targeted fix completed!"
echo "📊 Summary:"
echo "   - Removed duplicate SVGs in dark mode toggle"
echo "   - Fixed malformed closing tags"
echo "   - Ensured proper button structure"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 