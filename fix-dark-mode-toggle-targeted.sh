#!/bin/bash

# Targeted fix for dark mode toggle structure
# Only fix the specific issue with double SVGs and positioning

echo "🔧 Fixing dark mode toggle structure (targeted approach)..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Fix the dark mode toggle by replacing the broken structure
    # First, find and replace the problematic dark mode toggle section
    sed -i 's/<span class="dark:hidden">\s*<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">\s*<path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"\/>\s*<\/svg>\s*<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">\s*<path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"\/>\s*<\/svg>/<span class="dark:hidden">\n                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">\n                            <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"\/>\n                        <\/svg>/g' "$file"
    
    # Fix the light mode toggle section
    sed -i 's/<span class="hidden dark:inline">\s*<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">\s*<path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"\/>\s*<\/svg>\s*<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">\s*<path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"\/>\s*<\/svg>/<span class="hidden dark:inline">\n                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">\n                            <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"\/>\n                        <\/svg>/g' "$file"
}

# Update main index.html
echo "📄 Fixing main index.html..."
fix_file "index.html"

# Update a few category pages as examples
echo "📁 Fixing category pages..."
fix_file "categories/best-headphones-for-studying/index.html"
fix_file "categories/best-gaming-headsets/index.html"
fix_file "categories/best-noise-cancelling-headphones/index.html"

echo "✅ Dark mode toggle structure fixed!"
echo "🎯 Single SVG icons properly positioned"
echo "🔧 Removed double SVGs" 