#!/bin/bash

echo "🔍 Verifying mobile menu fixes across all pages..."

# Function to verify a single page
verify_page() {
    local file="$1"
    local issues=0
    
    # Check if mobile menu has proper hidden class
    if ! grep -q 'id="mobileMenu" class="hidden md:hidden' "$file"; then
        echo "❌ Issue in $file: Mobile menu missing proper hidden classes"
        issues=$((issues + 1))
    fi
    
    # Check if mobile menu button exists
    if ! grep -q 'id="mobileMenuButton"' "$file"; then
        echo "❌ Issue in $file: Mobile menu button missing"
        issues=$((issues + 1))
    fi
    
    # Check if JavaScript is loaded
    if ! grep -q 'src="/src/js/main.js"' "$file"; then
        echo "❌ Issue in $file: JavaScript not loaded"
        issues=$((issues + 1))
    fi
    
    # Check for duplicate mobile menu elements
    local mobile_menu_count=$(grep -c 'id="mobileMenu"' "$file")
    if [ "$mobile_menu_count" -gt 1 ]; then
        echo "❌ Issue in $file: Multiple mobile menu elements found ($mobile_menu_count)"
        issues=$((issues + 1))
    fi
    
    # Check for broken HTML structure (unclosed tags)
    if grep -q '<div[^>]*>$' "$file" && ! grep -q '</div>' "$file"; then
        echo "❌ Issue in $file: Potential unclosed div tags"
        issues=$((issues + 1))
    fi
    
    if [ $issues -eq 0 ]; then
        echo "✅ $file: All checks passed"
    fi
    
    return $issues
}

total_issues=0

# Verify all category pages
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        verify_page "${dir}index.html"
        total_issues=$((total_issues + $?))
    fi
done

# Also verify pages in src/pages/categories/
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        verify_page "$file"
        total_issues=$((total_issues + $?))
    fi
done

echo ""
echo "📊 Verification Summary:"
echo "Total issues found: $total_issues"

if [ $total_issues -eq 0 ]; then
    echo "🎉 All pages have correct mobile menu structure!"
    echo "✅ Mobile menu is properly hidden by default"
    echo "✅ Mobile menu button is present"
    echo "✅ JavaScript is loaded"
    echo "✅ No duplicate elements"
    echo "✅ HTML structure is clean"
else
    echo "⚠️  Some issues were found. Please review the output above."
fi 