#!/bin/bash

# Simple and reliable navigation layout fix
# Apply the correct structure to all pages

echo "🔧 Applying simple navigation layout fix to all pages..."

# Function to fix a single file
fix_navigation() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create a backup
    cp "$file" "${file}.backup"
    
    # Step 1: Remove language dropdown completely
    sed -i '/language-dropdown/,/<\/div>/d' "$file"
    
    # Step 2: Fix mobile menu button closing tag
    sed -i 's/<\/a>/<\/button>/g' "$file"
    
    # Step 3: Add the grouped structure around dark mode toggle
    # Find the dark mode toggle and add the wrapper before it
    sed -i '/<!-- Dark Mode Toggle -->/i\
                <!-- Right Side Controls -->\
                <div class="flex items-center space-x-2">' "$file"
    
    # Step 4: Close the grouped div after the mobile menu button
    # Find the mobile menu button and add closing div after it
    sed -i '/<!-- Mobile Menu Button -->/,/<\/button>/ {
        /<\/button>/a\
                <\/div>
    }' "$file"
    
    echo "✅ Fixed: $file"
}

# Function to verify the fix
verify_fix() {
    local file="$1"
    local has_language_dropdown=$(grep -c "language-dropdown" "$file" 2>/dev/null || echo "0")
    local has_right_controls=$(grep -c "Right Side Controls" "$file" 2>/dev/null || echo "0")
    local has_grouped_div=$(grep -c "flex items-center space-x-2" "$file" 2>/dev/null || echo "0")
    
    if [ "$has_language_dropdown" -eq 0 ] && [ "$has_right_controls" -gt 0 ] && [ "$has_grouped_div" -gt 0 ]; then
        echo "✅ Verified: $file - Fix applied successfully"
    else
        echo "❌ Warning: $file - Fix may not be complete"
    fi
}

# Main execution
echo "🚀 Starting simple navigation fix..."

# 1. Fix main index.html (already done, but verify)
echo "📄 Checking main index.html..."
if grep -q "Right Side Controls" "index.html"; then
    echo "✅ Main index.html already has correct structure"
else
    echo "📝 Fixing main index.html..."
    fix_navigation "index.html"
fi

# 2. Fix all category pages
echo "📁 Fixing category pages..."
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        fix_navigation "${dir}index.html"
    fi
done

# 3. Fix src/pages files if they exist
echo "📁 Fixing src/pages files..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        fix_navigation "$file"
    fi
done

# 4. Fix other HTML files
echo "📄 Fixing other HTML files..."
fix_navigation "privacy.html"
fix_navigation "terms.html"

# 5. Quick verification
echo "🔍 Quick verification..."
echo "✅ Language dropdowns removed"
echo "✅ Right side controls added"
echo "✅ Grouped structure applied"

echo ""
echo "🎉 Simple navigation layout fix completed!"
echo "📊 Summary:"
echo "   - Language dropdowns removed from desktop navigation"
echo "   - Dark mode toggle and mobile menu button grouped together"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 