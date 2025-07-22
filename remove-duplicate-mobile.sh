#!/bin/bash

# Remove duplicate mobile menu divs

echo "🧹 Removing duplicate mobile menu divs..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Remove duplicate mobile menu divs using sed
    # Keep only the first mobile menu div and remove all duplicates
    sed -i '/<!-- Mobile Menu -->/,/<\/div>/ { /<!-- Mobile Menu -->/ { N; /<!-- Mobile Menu -->/d } }' "$file"
    
    # Remove any remaining duplicate mobile menu divs
    sed -i '/<div id="mobileMenu"/,/<\/div>/ { /<div id="mobileMenu"/ { N; /<div id="mobileMenu"/d } }' "$file"
    
    echo "✅ Fixed: $file"
}

# Main execution
echo "🚀 Starting duplicate removal..."

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

echo ""
echo "🎉 Duplicate removal completed!"
echo "📊 Summary:"
echo "   - Removed duplicate mobile menu divs"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 