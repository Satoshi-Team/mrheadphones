#!/bin/bash

echo "🧪 Testing MrHeadphones.com locally..."

# Check if server is running
if curl -s http://localhost:8000 > /dev/null; then
    echo "✅ Local server is running on http://localhost:8000"
else
    echo "❌ Local server is not running. Start it with: python3 -m http.server 8000"
    exit 1
fi

# Test main page
echo "🔍 Testing main page..."
if curl -s -o /dev/null -w "%{http_code}" http://localhost:8000 | grep -q "200"; then
    echo "✅ Main page loads successfully"
else
    echo "❌ Main page failed to load"
fi

# Test a few category pages
echo "🔍 Testing category pages..."
category_pages=(
    "categories/best-wireless-headphones/"
    "categories/best-noise-cancelling-headphones/"
    "categories/best-headphones-for-iphone/"
    "categories/best-headphones-for-gaming/"
    "categories/best-headphones-under-100/"
)

for page in "${category_pages[@]}"; do
    if curl -s -o /dev/null -w "%{http_code}" "http://localhost:8000/$page" | grep -q "200"; then
        echo "✅ $page loads successfully"
    else
        echo "❌ $page failed to load"
    fi
done

# Test CSS file
echo "🔍 Testing CSS file..."
if curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/dist/output.css | grep -q "200"; then
    echo "✅ CSS file loads successfully"
else
    echo "❌ CSS file failed to load"
fi

# Test favicon
echo "🔍 Testing favicon..."
if curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/public/favicon.svg | grep -q "200"; then
    echo "✅ Favicon loads successfully"
else
    echo "❌ Favicon failed to load"
fi

echo ""
echo "🎉 Local testing completed!"
echo "🌐 Open http://localhost:8000 in your browser to view the site"
echo "📱 Test on different devices and screen sizes"
echo "🔍 Check browser developer tools for any console errors" 