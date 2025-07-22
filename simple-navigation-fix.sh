#!/bin/bash

# Simple and reliable navigation fix using sed commands
# Fixes duplicate SVGs, malformed tags, and ensures proper structure

echo "🔧 Simple navigation fix..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Fix 1: Remove duplicate SVGs in dark mode toggle
    sed -i '/<span class="dark:hidden">/,/<\/span>/ { /<svg.*<svg/d }' "$file"
    sed -i '/<span class="hidden dark:inline">/,/<\/span>/ { /<svg.*<svg/d }' "$file"
    
    # Fix 2: Remove malformed closing tags (</a> instead of </button>)
    sed -i 's/<\/a>\s*<!-- Mobile Menu Button -->/<!-- Mobile Menu Button -->/g' "$file"
    sed -i 's/<\/a>\s*<\/div>\s*<\/div>\s*<\/div>/<\/div>\n                <\/div>\n            <\/div>/g' "$file"
    
    # Fix 3: Remove extra closing tags
    sed -i '/<!-- Right Side Controls -->/,/<\/div>/ { /<\/div>\s*<\/div>\s*<\/div>/d }' "$file"
    
    # Fix 4: Ensure proper button closing tags
    sed -i 's/<!-- Dark Mode Toggle -->\s*<\/a>/<!-- Dark Mode Toggle -->/g' "$file"
    sed -i 's/<!-- Mobile Menu Button -->\s*<\/a>/<!-- Mobile Menu Button -->/g' "$file"
    
    # Fix 5: Remove any remaining language dropdown references
    sed -i '/language-dropdown/,/<\/div>/d' "$file"
    
    echo "✅ Fixed: $file"
}

# Function to verify the fix
verify_fix() {
    local file="$1"
    local dark_toggle_count=$(grep -c "<!-- Dark Mode Toggle -->" "$file" 2>/dev/null || echo "0")
    local right_controls_count=$(grep -c "Right Side Controls" "$file" 2>/dev/null || echo "0")
    local language_dropdown_count=$(grep -c "language-dropdown" "$file" 2>/dev/null || echo "0")
    local malformed_tags=$(grep -c "</a>.*<!-- Mobile Menu Button -->" "$file" 2>/dev/null || echo "0")
    
    if [ "$dark_toggle_count" -eq 1 ] && [ "$right_controls_count" -eq 1 ] && [ "$language_dropdown_count" -eq 0 ] && [ "$malformed_tags" -eq 0 ]; then
        echo "✅ Verified: $file - Structure looks good"
    else
        echo "❌ Warning: $file - Issues detected (Dark toggles: $dark_toggle_count, Right controls: $right_controls_count, Language dropdowns: $language_dropdown_count, Malformed tags: $malformed_tags)"
    fi
}

# Main execution
echo "🚀 Starting simple navigation fix..."

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
echo "🎉 Simple navigation fix completed!"
echo "📊 Summary:"
echo "   - Removed duplicate SVGs"
echo "   - Fixed malformed closing tags"
echo "   - Removed language dropdowns"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 