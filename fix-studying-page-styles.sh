#!/bin/bash

echo "🔧 Fixing studying page styles..."

# Fix the head section of the studying page
sed -i '22,24d' categories/best-headphones-for-studying/index.html

# Add the correct styles section after the favicon links
sed -i '/<link rel="icon" type="image\/png" sizes="16x16" href="\/public\/favicon-16x16.png">/a\
    <!-- Fonts -->\
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@400;500;600;700&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">\
    \
    <!-- Styles -->\
    <link href="/dist/output.css?v=1.0.3" rel="stylesheet">\
    ' categories/best-headphones-for-studying/index.html

echo "✅ Fixed studying page styles!"
echo "   - Added Google Fonts"
echo "   - Fixed CSS path to /dist/output.css"
echo "   - Added version parameter for cache busting" 