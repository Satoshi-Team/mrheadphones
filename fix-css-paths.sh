#!/bin/bash

echo "🔧 Fixing CSS paths in all category pages..."

# Find all HTML files in categories directory
find categories -name "*.html" -type f | while read -r file; do
    echo "Processing: $file"
    
    # Fix CSS path - replace relative paths with absolute paths
    sed -i 's|href="../../../dist/output.css|href="/dist/output.css|g' "$file"
    sed -i 's|href="../../dist/output.css|href="/dist/output.css|g' "$file"
    sed -i 's|href="../dist/output.css|href="/dist/output.css|g' "$file"
    
    # Fix favicon paths
    sed -i 's|href="../../../public/favicon.svg|href="/public/favicon.svg|g' "$file"
    sed -i 's|href="../../public/favicon.svg|href="/public/favicon.svg|g' "$file"
    sed -i 's|href="../public/favicon.svg|href="/public/favicon.svg|g' "$file"
    
    # Fix logo paths in navigation
    sed -i 's|src="/public/favicon.svg"|src="/public/favicon.svg"|g' "$file"
    sed -i 's|src="public/favicon.svg"|src="/public/favicon.svg"|g' "$file"
    
    echo "✅ Fixed paths in $file"
done

echo "🎉 All CSS paths have been fixed!" 