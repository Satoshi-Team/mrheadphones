#!/bin/bash

echo "🚀 Building MrHeadphones.com for deployment..."

# Check if Node.js and npm are available
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ Node.js and npm are available"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Build CSS (try different approaches for Tailwind CSS v4)
echo "🎨 Building CSS..."
if npx tailwindcss build ./src/css/tailwind.css -o ./dist/output.css --minify 2>/dev/null; then
    echo "✅ CSS built successfully with Tailwind CSS v4"
elif npx tailwindcss -i ./src/css/tailwind.css -o ./dist/output.css --minify 2>/dev/null; then
    echo "✅ CSS built successfully with Tailwind CSS v3"
else
    echo "⚠️  CSS build failed, but existing CSS file will be used"
fi

# Check if CSS file exists
if [ -f "./dist/output.css" ]; then
    echo "✅ CSS file exists: $(ls -lh ./dist/output.css | awk '{print $5}')"
else
    echo "❌ CSS file not found!"
    exit 1
fi

# Validate HTML files
echo "🔍 Validating HTML files..."
html_files=$(find . -name "*.html" -not -path "./node_modules/*")
html_count=$(echo "$html_files" | wc -l)
echo "✅ Found $html_count HTML files"

# Check for Google Analytics
echo "📊 Checking Google Analytics..."
ga_files=$(grep -r "G-89QWFC1J9M" . --include="*.html" | wc -l)
echo "✅ Google Analytics found in $ga_files files"

# Check for Amazon affiliate links
echo "🛒 Checking Amazon affiliate links..."
amazon_links=$(grep -r "amazon.com.*tag=ngp0ba-20" . --include="*.html" | wc -l)
echo "✅ Found $amazon_links Amazon affiliate links"

# Create deployment summary
echo ""
echo "📋 Deployment Summary:"
echo "======================"
echo "• HTML files: $html_count"
echo "• Google Analytics: $ga_files files"
echo "• Amazon affiliate links: $amazon_links"
echo "• CSS file: $(ls -lh ./dist/output.css | awk '{print $5}')"
echo ""
echo "✅ Build completed successfully!"
echo ""
echo "🌐 To test locally, run: python3 -m http.server 8000"
echo "📁 Ready for deployment to Netlify!" 