#!/bin/bash

echo "🔧 Fixing button text colors and checking layout..."

# Create backup
cp index.html index.html.backup.$(date +%Y%m%d_%H%M%S)

echo "Fixing button text colors for better readability in light mode..."

# Fix iPhone primary button - make text black in light mode
sed -i 's/bg-gradient-to-r from-blue-600 to-purple-700 hover:from-blue-700 hover:to-purple-800 text-white shadow-lg/bg-gradient-to-r from-blue-600 to-purple-700 hover:from-blue-700 hover:to-purple-800 text-black dark:text-white shadow-lg/g' index.html

# Fix Android primary button - make text black in light mode
sed -i 's/bg-gradient-to-r from-green-600 to-teal-700 hover:from-green-700 hover:to-teal-800 text-white shadow-lg/bg-gradient-to-r from-green-600 to-teal-700 hover:from-green-700 hover:to-teal-800 text-black dark:text-white shadow-lg/g' index.html

# Fix Gaming primary button - make text black in light mode
sed -i 's/bg-gradient-to-r from-purple-600 to-pink-700 hover:from-purple-700 hover:to-pink-800 text-white shadow-lg/bg-gradient-to-r from-purple-600 to-pink-700 hover:from-purple-700 hover:to-pink-800 text-black dark:text-white shadow-lg/g' index.html

echo "Checking for layout issues..."

# Check if CSS file exists and is accessible
if [ ! -f "dist/output.css" ]; then
    echo "⚠️  Warning: dist/output.css not found. Building CSS..."
    npm run build
fi

# Check for any broken HTML structure
echo "Checking HTML structure..."
if grep -q "<div.*<div.*<div.*<div.*<div" index.html; then
    echo "⚠️  Warning: Potential nested div issues found"
fi

# Check for missing closing tags
echo "Checking for missing closing tags..."
if grep -c "<div" index.html | grep -c ">" index.html | awk '{if($1 != $2) print "⚠️  Warning: Potential missing closing tags"}'; then
    echo "⚠️  Warning: Potential missing closing tags detected"
fi

echo "✅ Button text colors fixed and layout checked!" 