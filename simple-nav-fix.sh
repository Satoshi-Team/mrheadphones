#!/bin/bash

echo "🔧 Applying simple navigation fix..."

# Function to fix navigation layout safely
fix_nav_safely() {
    local file="$1"
    echo "Fixing navigation in: $file"
    
    # Replace the desktop menu section with better layout
    sed -i 's|<div class="hidden md:flex items-center space-x-8">|<div class="hidden md:flex items-center justify-center flex-1 mx-8">\
                    <div class="flex items-center space-x-8">|' "$file"
    
    # Add closing div for the new structure
    sed -i '/<a href="\/#budget" class="nav-link">Budget<\/a>/a\
                    </div>' "$file"
    
    echo "✅ Navigation layout updated for: $file"
}

# Fix the studying page
fix_nav_safely "categories/best-headphones-for-studying/index.html"

# Fix the gaming page
fix_nav_safely "categories/best-headphones-for-gaming/index.html"

# Fix the under-100 page
fix_nav_safely "categories/best-headphones-under-100/index.html"

echo "✅ Simple navigation fix applied!" 