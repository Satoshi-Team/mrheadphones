#!/bin/bash

echo "🔧 Rebuilding broken pages using working template..."

# Function to rebuild a page using the bluetooth page as template
rebuild_page() {
    local category="$1"
    local title="$2"
    local description="$3"
    local hero_title="$4"
    local hero_description="$5"
    
    local file="categories/${category}/index.html"
    
    echo "Rebuilding: $file"
    
    # Create the directory if it doesn't exist
    mkdir -p "categories/${category}"
    
    # Copy the working bluetooth page as template
    cp "categories/best-bluetooth-headphones/index.html" "$file"
    
    # Replace the title and description
    sed -i "s|<title>.*</title>|<title>${title}</title>|" "$file"
    sed -i "s|<meta name=\"description\" content=\".*\">|<meta name=\"description\" content=\"${description}\">|" "$file"
    
    # Replace the hero section content
    sed -i "s|Best Bluetooth Headphones|${hero_title}|" "$file"
    sed -i "s|Experience true wireless freedom with the best Bluetooth headphones. Expert picks for reliable connectivity, long battery life, and seamless device pairing.|${hero_description}|" "$file"
    
    echo "✅ Rebuilt: $file"
}

# Define the pages to rebuild with their content
declare -A pages=(
    ["best-headphones-for-studying"]="Best Headphones for Studying 2025 - Focus & Concentration | MrHeadphones.com|Find the best headphones for studying and focus. Expert picks for noise isolation, comfort during long study sessions, and audio that enhances concentration.|Best Headphones for Studying|Find the perfect headphones for focused studying. Expert picks for noise isolation, comfort during long study sessions, and audio that enhances concentration."
    ["best-headphones-for-gaming"]="Best Gaming Headphones 2025 - Top Picks for PC, PS5, Xbox | MrHeadphones.com|Find the best gaming headphones for PC, PS5, Xbox, and more. Expert picks with surround sound, clear microphones, and comfort for long gaming sessions.|Best Gaming Headphones|Level up your gaming experience with the best gaming headphones. Expert picks for PC, PS5, Xbox, and more with surround sound and clear microphones."
    ["best-noise-cancelling-headphones-for-travel"]="Best Noise Cancelling Headphones for Travel 2025 | MrHeadphones.com|Find the best noise cancelling headphones for travel. Expert picks for airplane noise, comfort during long flights, and portable design.|Best Noise Cancelling Headphones for Travel|Block out travel noise with the best noise cancelling headphones. Expert picks for airplane noise, comfort during long flights, and portable design."
    ["best-over-ear-headphones-under-100"]="Best Over-Ear Headphones Under $100 2025 | MrHeadphones.com|Find the best over-ear headphones under $100. Expert picks for quality sound, comfort, and value without breaking the bank.|Best Over-Ear Headphones Under $100|Get premium sound quality without the premium price. Expert picks for the best over-ear headphones under $100."
)

# Rebuild each page
for category in "${!pages[@]}"; do
    IFS='|' read -r title description hero_title hero_description <<< "${pages[$category]}"
    rebuild_page "$category" "$title" "$description" "$hero_title" "$hero_description"
done

echo "🎉 All broken pages rebuilt!" 