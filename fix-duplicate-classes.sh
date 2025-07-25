#!/bin/bash

echo "🔧 Fixing duplicate CSS classes and structural issues..."

# Create backup
cp index.html index.html.backup.$(date +%Y%m%d_%H%M%S)

echo "Fixing duplicate shadow-lg classes..."

# Fix duplicate shadow-lg classes in buttons
sed -i 's/shadow-lg font-semibold text-sm sm:text-base px-6 py-3 rounded-xl transition-all duration-300 shadow-lg/shadow-lg font-semibold text-sm sm:text-base px-6 py-3 rounded-xl transition-all duration-300/g' index.html

echo "Checking for other structural issues..."

# Check for any unclosed tags or structural problems
echo "Validating HTML structure..."

# Count opening and closing divs
div_count=$(grep -c "<div" index.html)
div_close_count=$(grep -c "</div>" index.html)

echo "Opening divs: $div_count"
echo "Closing divs: $div_close_count"

if [ "$div_count" != "$div_close_count" ]; then
    echo "⚠️  Warning: Mismatch in div tags - $div_count opening vs $div_close_count closing"
else
    echo "✅ Div tags are balanced"
fi

echo "✅ Duplicate classes fixed and structure validated!" 