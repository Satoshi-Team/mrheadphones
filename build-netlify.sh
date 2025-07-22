#!/bin/bash

echo "🚀 Building MrHeadphones.com for Netlify deployment..."

# Check if CSS file exists and is valid
if [ -f "./dist/output.css" ]; then
    echo "✅ CSS file exists: $(ls -lh ./dist/output.css | awk '{print $5}')"
    
    # Check if CSS file has content
    if [ -s "./dist/output.css" ]; then
        echo "✅ CSS file has content - ready for deployment"
        exit 0
    else
        echo "❌ CSS file is empty"
        exit 1
    fi
else
    echo "❌ CSS file not found at ./dist/output.css"
    echo "Attempting to build CSS..."
    
    # Try to install dependencies and build
    npm install
    
    # Try different Tailwind CSS build commands
    if npx tailwindcss build ./src/css/tailwind.css -o ./dist/output.css --minify 2>/dev/null; then
        echo "✅ CSS built successfully with Tailwind CSS v4"
        exit 0
    elif npx tailwindcss -i ./src/css/tailwind.css -o ./dist/output.css --minify 2>/dev/null; then
        echo "✅ CSS built successfully with Tailwind CSS v3"
        exit 0
    else
        echo "❌ Failed to build CSS"
        exit 1
    fi
fi 