#!/bin/bash

echo "🚀 Building MrHeadphones.com for Netlify deployment..."

# Create output directory
echo "📁 Creating output directory..."
rm -rf out
mkdir -p out

# Build CSS if needed
echo "🎨 Building CSS..."
if [ ! -f "./dist/output.css" ] || [ ! -s "./dist/output.css" ]; then
    echo "Building CSS with Tailwind..."
    if npx tailwindcss build ./src/css/tailwind.css -o ./dist/output.css --minify 2>/dev/null; then
        echo "✅ CSS built successfully with Tailwind CSS v4"
    elif npx tailwindcss -i ./src/css/tailwind.css -o ./dist/output.css --minify 2>/dev/null; then
        echo "✅ CSS built successfully with Tailwind CSS v3"
    else
        echo "❌ Failed to build CSS"
        exit 1
    fi
else
    echo "✅ CSS already exists and has content"
fi

# Copy main HTML files
echo "📄 Copying HTML files..."
cp index.html out/
cp privacy.html out/
cp terms.html out/

# Copy categories directory
echo "📂 Copying categories..."
cp -r categories out/

# Copy dist directory (CSS)
echo "🎨 Copying CSS..."
cp -r dist out/

# Copy public directory (assets)
echo "🖼️ Copying public assets..."
cp -r public out/

# Copy src directory (JavaScript)
echo "📜 Copying JavaScript..."
cp -r src out/

# Copy logo directory if it exists
if [ -d "logo" ]; then
    echo "🖼️ Copying logo assets..."
    cp -r logo out/
fi

# Copy translations if they exist
if [ -d "translations" ]; then
    echo "🌐 Copying translations..."
    cp -r translations out/
fi

# Copy sitemap if it exists
if [ -f "sitemap.xml" ]; then
    echo "🗺️ Copying sitemap..."
    cp sitemap.xml out/
fi

# Copy robots.txt if it exists
if [ -f "robots.txt" ]; then
    echo "🤖 Copying robots.txt..."
    cp robots.txt out/
fi

# Verify the build
echo "🔍 Verifying build..."
if [ -f "out/index.html" ] && [ -f "out/dist/output.css" ]; then
    echo "✅ Build verification successful!"
    echo "📊 Build summary:"
    echo "   - Main pages: $(ls out/*.html | wc -l) files"
    echo "   - Categories: $(find out/categories -name "*.html" | wc -l) pages"
    echo "   - CSS size: $(ls -lh out/dist/output.css | awk '{print $5}')"
    echo "   - Total build size: $(du -sh out | awk '{print $1}')"
    echo ""
    echo "🎉 Build complete! Ready for Netlify deployment."
    echo "📁 Upload the 'out' directory to Netlify"
else
    echo "❌ Build verification failed!"
    exit 1
fi 