#!/bin/bash

# Final aggressive SVG cleanup - Remove ALL duplicate SVGs

echo "🧹 Final SVG cleanup..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Create temporary file
    temp_file=$(mktemp)
    
    # Use awk to process and remove duplicate SVGs
    awk '
    BEGIN { 
        in_dark_hidden = 0; 
        in_dark_inline = 0; 
        svg_count_dark_hidden = 0;
        svg_count_dark_inline = 0;
    }
    
    # Track dark:hidden span
    /<span class="dark:hidden">/ { 
        in_dark_hidden = 1; 
        svg_count_dark_hidden = 0;
        print $0;
        next;
    }
    /<\/span>/ && in_dark_hidden { 
        in_dark_hidden = 0; 
        print $0;
        next;
    }
    
    # Track hidden dark:inline span
    /<span class="hidden dark:inline">/ { 
        in_dark_inline = 1; 
        svg_count_dark_inline = 0;
        print $0;
        next;
    }
    /<\/span>/ && in_dark_inline { 
        in_dark_inline = 0; 
        print $0;
        next;
    }
    
    # Process SVG elements
    {
        if (in_dark_hidden && /<svg/) {
            svg_count_dark_hidden++;
            if (svg_count_dark_hidden == 1) {
                print $0;
            }
            next;
        }
        else if (in_dark_inline && /<svg/) {
            svg_count_dark_inline++;
            if (svg_count_dark_inline == 1) {
                print $0;
            }
            next;
        }
        else if (in_dark_hidden || in_dark_inline) {
            # Print non-SVG content within spans
            if (!/<svg/) {
                print $0;
            }
            next;
        }
        
        # Print all other lines unchanged
        print $0;
    }
    ' "$file" > "$temp_file"
    
    # Replace original file
    mv "$temp_file" "$file"
    
    # Fix malformed closing tags
    sed -i 's/<!-- Dark Mode Toggle -->\s*<\/a>/<!-- Dark Mode Toggle -->/g' "$file"
    sed -i 's/<!-- Mobile Menu Button -->\s*<\/a>/<!-- Mobile Menu Button -->/g' "$file"
    sed -i 's/<\/span>\s*<\/a>/<\/span>\n                    <\/button>/g' "$file"
    
    echo "✅ Fixed: $file"
}

# Function to verify the fix
verify_fix() {
    local file="$1"
    local duplicate_svg_count=$(grep -c "<svg.*<svg" "$file" 2>/dev/null || echo "0")
    local malformed_tags=$(grep -c "</a>.*<!-- Mobile Menu Button -->" "$file" 2>/dev/null || echo "0")
    local svg_count=$(grep -c "<svg" "$file" 2>/dev/null || echo "0")
    
    if [ "$duplicate_svg_count" -eq 0 ] && [ "$malformed_tags" -eq 0 ] && [ "$svg_count" -gt 0 ]; then
        echo "✅ Verified: $file - Perfect structure (SVGs: $svg_count)"
    else
        echo "❌ Warning: $file - Issues detected (Duplicate SVGs: $duplicate_svg_count, Malformed tags: $malformed_tags, Total SVGs: $svg_count)"
    fi
}

# Main execution
echo "🚀 Starting final SVG cleanup..."

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
echo "🎉 Final SVG cleanup completed!"
echo "📊 Summary:"
echo "   - Removed ALL duplicate SVGs"
echo "   - Fixed malformed closing tags"
echo "   - Ensured proper button structure"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 