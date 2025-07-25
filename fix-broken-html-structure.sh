#!/bin/bash

echo "🔧 Fixing broken HTML structure and removing duplicates..."

# Function to fix broken HTML structure in a file
fix_broken_html_structure() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Create a clean version of the file with proper structure
    awk '
    BEGIN { 
        in_main_content = 0
        in_related_articles = 0
        in_footer = 0
        print_section = 1
    }
    
    # Start of main content section
    /<!-- Top Picks -->/ { 
        in_main_content = 1 
        print_section = 1
    }
    
    # End of main content section (before related articles)
    /<!-- Kids Safety Features Section -->/ { 
        in_main_content = 0 
        print_section = 1
    }
    
    # Start of related articles section
    /Related Articles/ { 
        in_related_articles = 1 
        print_section = 1
    }
    
    # Start of footer
    /<!-- Footer -->/ { 
        in_related_articles = 0 
        in_footer = 1
        print_section = 1
    }
    
    # Skip broken related articles section
    in_related_articles && /grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3/ {
        print_section = 0
        next
    }
    
    # Resume printing after broken section
    in_related_articles && /<\/div>/ && !print_section {
        # Count closing divs to find end of broken section
        div_count++
        if (div_count >= 20) {  # Approximate number of broken divs
            print_section = 1
            div_count = 0
        }
        next
    }
    
    # Print if section is active
    print_section { print }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    
    # Add proper related articles section
    awk '
    /<!-- Kids Safety Features Section -->/ {
        print
        print "            </div>"
        print "            <!-- Related Articles Section -->"
        print "            <div class=\"mb-12\">"
        print "                <h2 class=\"font-heading font-bold text-2xl sm:text-3xl mb-8 text-center\">"
        print "                    Related Articles"
        print "                </h2>"
        print "                <div class=\"grid grid-cols-1 md:grid-cols-2 gap-8\">"
        print "                    <a href=\"/categories/best-headphones-under-100/\" class=\"related-article-btn\">"
        print "                        <h3>Best Headphones Under $100</h3>"
        print "                        <p>Budget-friendly options for the whole family.</p>"
        print "                        <span class=\"btn-arrow\">Read More <svg class=\"w-4 h-4 ml-1\" fill=\"none\" stroke=\"currentColor\" viewBox=\"0 0 24 24\"><path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M9 5l7 7-7 7\"></path></svg></span>"
        print "                    </a>"
        print "                    <a href=\"/categories/best-wireless-headphones/\" class=\"related-article-btn\">"
        print "                        <h3>Best Wireless Headphones</h3>"
        print "                        <p>Complete guide to wireless audio solutions.</p>"
        print "                        <span class=\"btn-arrow\">Read More <svg class=\"w-4 h-4 ml-1\" fill=\"none\" stroke=\"currentColor\" viewBox=\"0 0 24 24\"><path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M9 5l7 7-7 7\"></path></svg></span>"
        print "                    </a>"
        print "                </div>"
        print "            </div>"
        next
    }
    { print }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
}

# Find all HTML files and apply the fix
find . -type f -name "*.html" | while read -r file; do
    fix_broken_html_structure "$file"
done

echo "✅ Broken HTML structure fix applied!" 