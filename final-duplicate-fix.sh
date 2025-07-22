#!/bin/bash

# Final fix for duplicate dark mode buttons and positioning
# Ensure dark mode toggle is next to hamburger menu on all pages

echo "🔧 Final fix for duplicate dark mode buttons and positioning..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create a backup
    cp "$file" "${file}.backup"
    
    # Create a temporary file for the corrected structure
    temp_file=$(mktemp)
    
    # Use awk to process the file and fix the structure
    awk '
    BEGIN { 
        in_nav = 0; 
        in_desktop_nav = 0; 
        in_dark_toggle = 0; 
        in_mobile_button = 0; 
        skip_language = 0; 
        printed_right_controls = 0; 
        dark_toggle_count = 0;
    }
    
    # Track navigation section
    /<!-- Navigation -->/ { in_nav = 1; }
    /<\/nav>/ { in_nav = 0; }
    
    # Track desktop navigation section
    /<!-- Desktop Navigation -->/ { in_desktop_nav = 1; }
    /<\/div>/ && in_desktop_nav { in_desktop_nav = 0; }
    
    # Track dark mode toggle section
    /<!-- Dark Mode Toggle -->/ { 
        in_dark_toggle = 1; 
        dark_toggle_count++;
        # Only process the first occurrence
        if (dark_toggle_count == 1) {
            if (!printed_right_controls) {
                print "                <!-- Right Side Controls -->"
                print "                <div class=\"flex items-center space-x-2\">"
                printed_right_controls = 1
            }
            print "                    <!-- Dark Mode Toggle -->"
        }
        next
    }
    /<\/button>/ && in_dark_toggle { 
        in_dark_toggle = 0; 
        if (dark_toggle_count == 1) {
            print "                </button>"
        }
        next
    }
    
    # Track mobile menu button section
    /<!-- Mobile Menu Button -->/ { in_mobile_button = 1; }
    /<\/button>/ && in_mobile_button { 
        in_mobile_button = 0; 
        if (printed_right_controls) {
            print "                </button>"
            print "                </div>"
        }
        next
    }
    
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
            else if (in_dark_toggle && dark_toggle_count == 1) {
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
                } else {
                    print $0
                }
                next
            }
            else if (in_dark_toggle && dark_toggle_count > 1) {
                # Skip duplicate dark mode toggles
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

# Function to verify the fix
verify_fix() {
    local file="$1"
    local dark_toggle_count=$(grep -c "<!-- Dark Mode Toggle -->" "$file" 2>/dev/null || echo "0")
    local right_controls_count=$(grep -c "Right Side Controls" "$file" 2>/dev/null || echo "0")
    local language_dropdown_count=$(grep -c "language-dropdown" "$file" 2>/dev/null || echo "0")
    
    if [ "$dark_toggle_count" -eq 1 ] && [ "$right_controls_count" -eq 1 ] && [ "$language_dropdown_count" -eq 0 ]; then
        echo "✅ Verified: $file - Fix applied successfully"
    else
        echo "❌ Warning: $file - Fix may not be complete (Dark toggles: $dark_toggle_count, Right controls: $right_controls_count, Language dropdowns: $language_dropdown_count)"
    fi
}

# Main execution
echo "🚀 Starting final duplicate fix..."

# 1. Fix main index.html
echo "📄 Fixing main index.html..."
fix_file "index.html"

# 2. Fix all category pages
echo "📁 Fixing category pages..."
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        fix_file "${dir}index.html"
    fi
done

# 3. Fix src/pages files if they exist
echo "📁 Fixing src/pages files..."
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        fix_file "$file"
    fi
done

# 4. Fix other HTML files
echo "📄 Fixing other HTML files..."
fix_file "privacy.html"
fix_file "terms.html"

# 5. Verify fixes
echo "🔍 Verifying fixes..."
verify_fix "index.html"
for dir in categories/*/; do
    if [ -f "${dir}index.html" ]; then
        verify_fix "${dir}index.html"
    fi
done
for file in src/pages/categories/*.html; do
    if [ -f "$file" ]; then
        verify_fix "$file"
    fi
done
verify_fix "privacy.html"
verify_fix "terms.html"

echo ""
echo "🎉 Final duplicate fix completed!"
echo "📊 Summary:"
echo "   - Removed duplicate dark mode toggles"
echo "   - Positioned dark mode toggle next to hamburger menu"
echo "   - Removed language dropdowns completely"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 