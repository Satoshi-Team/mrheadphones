#!/bin/bash

echo "🔧 Fixing all broken pages..."

# Function to create a page from the studying template
create_page() {
    local category="$1"
    local title="$2"
    local description="$3"
    local hero_title="$4"
    local hero_description="$5"
    local content_intro="$6"
    local content_intro2="$7"
    
    local file="categories/${category}/index.html"
    
    echo "Creating: $file"
    
    # Create the directory if it doesn't exist
    mkdir -p "categories/${category}"
    
    # Copy the working studying page as template
    cp "categories/best-headphones-for-studying/index.html" "$file"
    
    # Replace the title and description using sed with proper escaping
    sed -i "s|<title>.*</title>|<title>${title}</title>|" "$file"
    sed -i "s|<meta name=\"description\" content=\".*\">|<meta name=\"description\" content=\"${description}\">|" "$file"
    
    # Replace the hero section content
    sed -i "s|Best Headphones for Studying|${hero_title}|" "$file"
    sed -i "s|Find the perfect headphones for focused studying. Expert picks for noise isolation, comfort during long study sessions, and audio that enhances concentration.|${hero_description}|" "$file"
    
    # Replace the content introduction
    sed -i "s|Finding the right headphones for studying can make a significant difference in your focus and productivity. The best study headphones provide excellent noise isolation, long-lasting comfort, and audio quality that enhances rather than distracts from your learning.|${content_intro}|" "$file"
    sed -i "s|We've tested headphones specifically for studying scenarios to find options that help you maintain concentration during long study sessions, whether you're in a noisy library, shared living space, or need background music to focus.|${content_intro2}|" "$file"
    
    # Replace the section title
    sed -i "s|Our Top Study Headphones|Our Top ${hero_title}|" "$file"
    
    echo "✅ Created: $file"
}

# Define the pages to create with their content
create_page "best-headphones-for-gaming" \
    "Best Gaming Headphones 2025 - Top Picks for PC, PS5, Xbox | MrHeadphones.com" \
    "Find the best gaming headphones for PC, PS5, Xbox, and more. Expert picks with surround sound, clear microphones, and comfort for long gaming sessions." \
    "Best Gaming Headphones" \
    "Level up your gaming experience with the best gaming headphones. Expert picks for PC, PS5, Xbox, and more with surround sound and clear microphones." \
    "Gaming headphones are essential for an immersive gaming experience. The best gaming headphones provide crystal-clear audio, comfortable fit for long sessions, and features that give you a competitive edge." \
    "We've tested gaming headphones across different platforms to find options that deliver exceptional sound quality, reliable microphone performance, and comfort that lasts through marathon gaming sessions."

create_page "best-noise-cancelling-headphones-for-travel" \
    "Best Noise Cancelling Headphones for Travel 2025 | MrHeadphones.com" \
    "Find the best noise cancelling headphones for travel. Expert picks for airplane noise, comfort during long flights, and portable design." \
    "Best Noise Cancelling Headphones for Travel" \
    "Block out travel noise with the best noise cancelling headphones. Expert picks for airplane noise, comfort during long flights, and portable design." \
    "Travel can be noisy and stressful, but the right noise cancelling headphones can transform your journey. The best travel headphones provide superior noise cancellation, long battery life, and compact design." \
    "We've tested noise cancelling headphones specifically for travel scenarios to find options that effectively block airplane noise, provide comfort during long flights, and are easy to pack and carry."

create_page "best-over-ear-headphones-under-100" \
    "Best Over-Ear Headphones Under $100 2025 | MrHeadphones.com" \
    "Find the best over-ear headphones under $100. Expert picks for quality sound, comfort, and value without breaking the bank." \
    "Best Over-Ear Headphones Under $100" \
    "Get premium sound quality without the premium price. Expert picks for the best over-ear headphones under $100." \
    "You don't need to spend a fortune to get great sound quality. The best over-ear headphones under $100 offer excellent audio performance, comfortable fit, and reliable build quality." \
    "We've tested budget-friendly over-ear headphones to find options that deliver impressive sound quality, comfortable wear, and durable construction without exceeding the $100 price point."

echo "🎉 All broken pages fixed!" 