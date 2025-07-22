#!/bin/bash

# Fix navigation layout across all pages
# Remove language dropdown and group dark mode toggle with mobile menu button

echo "🔧 Fixing navigation layout across all pages..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Remove language dropdown from desktop navigation
    sed -i '/<div class="language-dropdown">/,/<\/div>/d' "$file"
    
    # Group dark mode toggle and mobile menu button together
    # First, find the dark mode toggle and mobile menu button sections
    # Then replace them with the grouped structure
    
    # Create a temporary file for the replacement
    temp_file=$(mktemp)
    
    # Use awk to process the file and make the replacement
    awk '
    BEGIN { in_desktop_nav = 0; in_dark_toggle = 0; in_mobile_button = 0; skip_next = 0; }
    
    # Track desktop navigation section
    /<!-- Desktop Navigation -->/ { in_desktop_nav = 1; }
    /<\/div>/ && in_desktop_nav { in_desktop_nav = 0; }
    
    # Track dark mode toggle section
    /<!-- Dark Mode Toggle -->/ { in_dark_toggle = 1; }
    /<\/button>/ && in_dark_toggle { in_dark_toggle = 0; skip_next = 1; }
    
    # Track mobile menu button section
    /<!-- Mobile Menu Button -->/ { in_mobile_button = 1; }
    /<\/button>/ && in_mobile_button { in_mobile_button = 0; skip_next = 1; }
    
    # Print lines unless we are in sections to be replaced
    {
        if (in_desktop_nav && /<div class="language-dropdown">/) {
            # Skip language dropdown
            next
        }
        else if (in_dark_toggle && /<!-- Dark Mode Toggle -->/) {
            # Start of new grouped structure
            print "                <!-- Right Side Controls -->"
            print "                <div class=\"flex items-center space-x-2\">"
            print "                    <!-- Dark Mode Toggle -->"
            next
        }
        else if (in_dark_toggle) {
            # Print dark mode toggle content
            print $0
            next
        }
        else if (in_mobile_button && /<!-- Mobile Menu Button -->/) {
            # Skip mobile menu button comment, continue with content
            next
        }
        else if (in_mobile_button) {
            # Print mobile menu button content
            print $0
            next
        }
        else if (skip_next && /<\/a>/) {
            # Fix mobile menu button closing tag
            print "                    </button>"
            print "                </div>"
            skip_next = 0
            next
        }
        else if (skip_next) {
            skip_next = 0
        }
        
        # Print all other lines
        print $0
    }
    ' "$file" > "$temp_file"
    
    # Replace original file with fixed version
    mv "$temp_file" "$file"
}

# Update main index.html
echo "📄 Fixing main index.html..."
fix_file "index.html"

# Update all category pages
echo "📁 Fixing category pages..."
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        fix_file "${dir}index.html"
    fi
done

# Update src/pages files if they exist
echo "📁 Fixing src/pages files..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        fix_file "$file"
    fi
done

# Update other HTML files
echo "📄 Fixing other HTML files..."
fix_file "privacy.html"
fix_file "terms.html"

echo "✅ Navigation layout fixed across all pages!"
echo "🎯 Dark mode toggle and mobile menu button grouped together"
echo "🔧 Language dropdown removed from desktop navigation" 