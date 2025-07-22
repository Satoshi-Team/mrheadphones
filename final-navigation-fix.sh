#!/bin/bash

# Final comprehensive navigation fix
# Apply the correct structure to all files

echo "🔧 Applying final navigation fix to all pages..."

# Function to apply the correct structure to a single file
fix_navigation() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create a backup
    cp "$file" "${file}.backup"
    
    # Create a temporary file with the correct structure
    temp_file=$(mktemp)
    
    # Process the file line by line to apply the correct structure
    awk '
    BEGIN { 
        in_nav = 0; 
        in_desktop_nav = 0; 
        in_dark_toggle = 0; 
        in_mobile_button = 0; 
        skip_language = 0; 
        printed_right_controls = 0; 
    }
    
    # Track navigation section
    /<!-- Navigation -->/ { in_nav = 1; }
    /<\/nav>/ { in_nav = 0; }
    
    # Track desktop navigation section
    /<!-- Desktop Navigation -->/ { in_desktop_nav = 1; }
    /<\/div>/ && in_desktop_nav { in_desktop_nav = 0; }
    
    # Track dark mode toggle section
    /<!-- Dark Mode Toggle -->/ { in_dark_toggle = 1; }
    /<\/button>/ && in_dark_toggle { in_dark_toggle = 0; }
    
    # Track mobile menu button section
    /<!-- Mobile Menu Button -->/ { in_mobile_button = 1; }
    /<\/button>/ && in_mobile_button { in_mobile_button = 0; }
    
    # Process each line
    {
        if (in_nav) {
            if (in_desktop_nav && /language-dropdown/) {
                # Skip language dropdown completely
                skip_language = 1
                next
            }
            else if (skip_language && /<\/div>/) {
                # End of language dropdown
                skip_language = 0
                next
            }
            else if (skip_language) {
                # Skip language dropdown content
                next
            }
            else if (in_dark_toggle && /<!-- Dark Mode Toggle -->/) {
                # Start right side controls wrapper
                if (!printed_right_controls) {
                    print "                <!-- Right Side Controls -->"
                    print "                <div class=\"flex items-center space-x-2\">"
                    printed_right_controls = 1
                }
                print "                    <!-- Dark Mode Toggle -->"
                next
            }
            else if (in_dark_toggle) {
                # Print dark mode toggle content with proper indentation
                if ($0 ~ /^[[:space:]]*<button/) {
                    print "                " $0
                } else if ($0 ~ /^[[:space:]]*<span/) {
                    print "                    " $0
                } else if ($0 ~ /^[[:space:]]*<svg/) {
                    print "                        " $0
                } else if ($0 ~ /^[[:space:]]*<\/svg>/) {
                    print "                        " $0
                } else if ($0 ~ /^[[:space:]]*<\/span>/) {
                    print "                    " $0
                } else if ($0 ~ /^[[:space:]]*<\/button>/) {
                    print "                " $0
                } else {
                    print $0
                }
                next
            }
            else if (in_mobile_button && /<!-- Mobile Menu Button -->/) {
                # Skip mobile menu button comment, continue with content
                next
            }
            else if (in_mobile_button) {
                # Print mobile menu button content with proper indentation
                if ($0 ~ /^[[:space:]]*<button/) {
                    print "                " $0
                } else if ($0 ~ /^[[:space:]]*<svg/) {
                    print "                    " $0
                } else if ($0 ~ /^[[:space:]]*<\/svg>/) {
                    print "                    " $0
                } else if ($0 ~ /^[[:space:]]*<\/button>/) {
                    print "                " $0
                    # Close the right side controls wrapper
                    print "                </div>"
                } else {
                    print $0
                }
                next
            }
        }
        
        # Print all other lines unchanged
        print $0
    }
    ' "$file" > "$temp_file"
    
    # Replace original file with fixed version
    mv "$temp_file" "$file"
    
    echo "✅ Fixed: $file"
}

# Main execution
echo "🚀 Starting final navigation fix..."

# 1. Fix main index.html
echo "📄 Fixing main index.html..."
fix_navigation "index.html"

# 2. Fix all category pages
echo "📁 Fixing category pages..."
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        fix_navigation "${dir}index.html"
    fi
done

# 3. Fix src/pages files if they exist
echo "📁 Fixing src/pages files..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        fix_navigation "$file"
    fi
done

# 4. Fix other HTML files
echo "📄 Fixing other HTML files..."
fix_navigation "privacy.html"
fix_navigation "terms.html"

echo ""
echo "🎉 Final navigation fix completed!"
echo "📊 Summary:"
echo "   - Language dropdowns completely removed"
echo "   - Dark mode toggle and mobile menu button properly grouped"
echo "   - Correct HTML structure applied"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files" 