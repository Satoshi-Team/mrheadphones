#!/bin/bash

echo "🔧 Fixing Device Integration section styling..."

# Create backup
cp index.html index.html.backup.$(date +%Y%m%d_%H%M%S)

echo "Fixing SVG sizes to match Browse by Category section..."

# Fix iPhone SVG sizes
sed -i 's/w-20 h-20 bg-gradient-to-br from-blue-500 to-purple-600 rounded-3xl/w-16 h-16 bg-gradient-to-br from-blue-500 to-purple-600 rounded-2xl/g' index.html
sed -i 's/w-10 h-10 sm:w-12 sm:h-12 lg:w-14 lg:h-14/w-8 h-8 sm:w-10 sm:h-10 lg:w-12 lg:h-12/g' index.html

# Fix Android SVG sizes
sed -i 's/w-20 h-20 bg-gradient-to-br from-green-500 to-teal-600 rounded-3xl/w-16 h-16 bg-gradient-to-br from-green-500 to-teal-600 rounded-2xl/g' index.html

# Fix Gaming SVG sizes
sed -i 's/w-20 h-20 bg-gradient-to-br from-purple-500 to-pink-600 rounded-3xl/w-16 h-16 bg-gradient-to-br from-purple-500 to-pink-600 rounded-2xl/g' index.html

echo "Fixing button readability in light mode..."

# Fix iPhone outline button - make text darker for better contrast
sed -i 's/border-blue-500 text-blue-600 hover:bg-blue-500 hover:text-white/border-blue-500 text-blue-700 dark:text-blue-600 hover:bg-blue-500 hover:text-white/g' index.html

# Fix Android outline button - make text darker for better contrast
sed -i 's/border-green-500 text-green-600 hover:bg-green-500 hover:text-white/border-green-500 text-green-700 dark:text-green-600 hover:bg-green-500 hover:text-white/g' index.html

# Fix Gaming outline button - make text darker for better contrast
sed -i 's/border-purple-500 text-purple-600 hover:bg-purple-500 hover:text-white/border-purple-500 text-purple-700 dark:text-purple-600 hover:bg-purple-500 hover:text-white/g' index.html

echo "✅ Device Integration styling fixed!" 