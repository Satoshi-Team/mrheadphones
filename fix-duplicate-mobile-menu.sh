#!/bin/bash

echo "🔧 Fixing duplicate mobile menu sections..."

# Function to remove duplicate mobile menu sections
fix_duplicates() {
    local file="$1"
    echo "Processing: $file"
    
    # Create a temporary file
    temp_file=$(mktemp)
    
    # Use awk to remove duplicate mobile menu sections
    awk '
    BEGIN { 
        mobile_menu_count = 0
        in_mobile_menu = 0
    }
    /<!-- Mobile Menu -->/ { 
        mobile_menu_count++
        if (mobile_menu_count > 1) {
            in_mobile_menu = 1
            next
        }
    }
    /<div id="mobileMenu"/ { 
        mobile_menu_count++
        if (mobile_menu_count > 1) {
            in_mobile_menu = 1
            next
        }
    }
    /<\/div>/ && in_mobile_menu { 
        in_mobile_menu = 0
        next
    }
    in_mobile_menu { next }
    { print }
    ' "$file" > "$temp_file"
    
    # Replace the original file
    mv "$temp_file" "$file"
}

# Find all HTML files and process them
find . -name "*.html" -type f | while read -r file; do
    # Skip backup files
    if [[ "$file" != *".backup"* ]]; then
        fix_duplicates "$file"
    fi
done

echo "✅ Duplicate mobile menu sections removed!" 