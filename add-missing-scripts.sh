#!/bin/bash

echo "🔧 Adding missing JavaScript script tags..."

# Function to add script tag to a page
add_script_tag() {
    local file="$1"
    echo "Adding script tag to: $file"
    
    # Check if script tag already exists
    if grep -q 'src="/src/js/main.js"' "$file"; then
        echo "✅ Script tag already exists in: $file"
        return
    fi
    
    # Add script tag before closing body tag
    sed -i 's|</body>|<script src="/src/js/main.js"></script>\n</body>|' "$file"
    
    echo "✅ Added script tag to: $file"
}

# List of pages that were rebuilt and need script tags
rebuilt_pages=(
    "categories/best-headphones-for-gaming/index.html"
    "categories/best-headphones-for-studying/index.html"
    "categories/best-noise-cancelling-headphones-for-travel/index.html"
    "categories/best-over-ear-headphones-under-100/index.html"
)

# Add script tags to each page
for page in "${rebuilt_pages[@]}"; do
    if [ -f "$page" ]; then
        add_script_tag "$page"
    fi
done

echo "🎉 Script tags added successfully!" 