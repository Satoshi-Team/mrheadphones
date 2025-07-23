#!/bin/bash

echo "🔧 Final navigation cleanup..."

# Function to clean up navigation artifacts
cleanup_navigation() {
    local file="$1"
    echo "Processing: $file"
    
    # Create a temporary file
    temp_file=$(mktemp)
    
    # Remove any remaining navigation artifacts
    sed '
    # Remove any duplicate mobile menu buttons
    /<button id="mobileMenuToggle"/d
    /<button id="mobileMenuButton"/d
    
    # Remove any orphaned div tags that might be left over
    /^[[:space:]]*<\/div>[[:space:]]*$/d
    
    # Remove any empty lines that might have been created
    /^[[:space:]]*$/d
    ' "$file" > "$temp_file"
    
    # Replace the original file
    mv "$temp_file" "$file"
}

# Find all HTML files and process them
find . -name "*.html" -type f | while read -r file; do
    # Skip backup files
    if [[ "$file" != *".backup"* ]]; then
        cleanup_navigation "$file"
    fi
done

echo "✅ Final navigation cleanup completed!" 