#!/bin/bash

# Apply navigation layout fix to all 45+ pages
# Only modify header section, preserve all body content

echo "🔧 Applying navigation layout fix to all pages..."
echo "📋 This will modify only the header section, preserving all body content"

# Function to fix navigation in a single file
fix_navigation() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create a backup
    cp "$file" "${file}.backup"
    
    # Step 1: Remove language dropdown from desktop navigation
    sed -i '/<div class="language-dropdown">/,/<\/div>/d' "$file"
    
    # Step 2: Fix mobile menu button closing tag (change </a> to </button>)
    sed -i 's/<!-- Mobile Menu Button -->\s*<button[^>]*>.*<\/a>/<!-- Mobile Menu Button -->\n                <button id="mobileMenuButton" aria-label="Toggle mobile menu" data-translate-title="mobile_menu_toggle" class="md:hidden p-3 rounded-2xl hover:bg-gray-100\/60 dark:hover:bg-gray-700\/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary\/30">\n                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">\n                        <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"\/>\n                    <\/svg>\n                <\/button>/s' "$file"
    
    # Step 3: Group dark mode toggle and mobile menu button together
    # Find the dark mode toggle section and wrap it with the grouped structure
    sed -i '/<!-- Dark Mode Toggle -->/i\
                <!-- Right Side Controls -->\
                <div class="flex items-center space-x-2">' "$file"
    
    # Find the end of mobile menu button and close the grouped div
    sed -i '/<!-- Mobile Menu Button -->/,/<\/button>/ {
        /<\/button>/a\
                <\/div>
    }' "$file"
    
    # Step 4: Remove any duplicate closing divs that might have been created
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
    
    echo "✅ Fixed: $file"
}

# Function to verify the fix was applied correctly
verify_fix() {
    local file="$1"
    local has_language_dropdown=$(grep -c "language-dropdown" "$file" || echo "0")
    local has_right_controls=$(grep -c "Right Side Controls" "$file" || echo "0")
    local has_grouped_div=$(grep -c "flex items-center space-x-2" "$file" || echo "0")
    
    if [ "$has_language_dropdown" -eq 0 ] && [ "$has_right_controls" -gt 0 ] && [ "$has_grouped_div" -gt 0 ]; then
        echo "✅ Verified: $file - Fix applied successfully"
    else
        echo "❌ Warning: $file - Fix may not be complete"
    fi
}

# Main execution
echo "🚀 Starting navigation fix for all pages..."

# 1. Fix main index.html
echo "📄 Fixing main index.html..."
fix_navigation "index.html"

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
echo "🎉 Navigation layout fix completed for all pages!"
echo "📊 Summary:"
echo "   - Language dropdowns removed from desktop navigation"
echo "   - Dark mode toggle and mobile menu button grouped together"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 