#!/bin/bash

echo "🔧 Fixing Device Integration section - SVG centering and button visibility..."

# Create backup
cp index.html index.html.backup.$(date +%Y%m%d_%H%M%S)

echo "Fixing SVG centering and button visibility..."

# Fix iPhone section - improve SVG centering and button visibility
sed -i 's/<div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-br from-blue-500 to-purple-600 rounded-2xl shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110 mb-6">/<div class="flex items-center justify-center w-16 h-16 bg-gradient-to-br from-blue-500 to-purple-600 rounded-2xl shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110 mb-6 mx-auto">/g' index.html

# Fix iPhone primary button - make it more visible
sed -i 's/bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 text-white/bg-gradient-to-r from-blue-600 to-purple-700 hover:from-blue-700 hover:to-purple-800 text-white shadow-lg/g' index.html

# Fix Android section - improve SVG centering and button visibility
sed -i 's/<div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-br from-green-500 to-teal-600 rounded-2xl shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110 mb-6">/<div class="flex items-center justify-center w-16 h-16 bg-gradient-to-br from-green-500 to-teal-600 rounded-2xl shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110 mb-6 mx-auto">/g' index.html

# Fix Android primary button - make it more visible
sed -i 's/bg-gradient-to-r from-green-500 to-teal-600 hover:from-green-600 hover:to-teal-700 text-white/bg-gradient-to-r from-green-600 to-teal-700 hover:from-green-700 hover:to-teal-800 text-white shadow-lg/g' index.html

# Fix Gaming section - improve SVG centering and button visibility
sed -i 's/<div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-br from-purple-500 to-pink-600 rounded-2xl shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110 mb-6">/<div class="flex items-center justify-center w-16 h-16 bg-gradient-to-br from-purple-500 to-pink-600 rounded-2xl shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110 mb-6 mx-auto">/g' index.html

# Fix Gaming primary button - make it more visible
sed -i 's/bg-gradient-to-r from-purple-500 to-pink-600 hover:from-purple-600 hover:to-pink-700 text-white/bg-gradient-to-r from-purple-600 to-pink-700 hover:from-purple-700 hover:to-pink-800 text-white shadow-lg/g' index.html

echo "✅ Device Integration section fixed - SVGs centered and buttons visible!" 