#!/bin/bash

# Simple and reliable fix for navigation layout across all HTML files
# Remove language dropdown and group dark mode toggle with mobile menu button

echo "🔧 Fixing navigation layout across ALL HTML files..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create a backup of the original file
    cp "$file" "${file}.backup"
    
    # Step 1: Remove language dropdown section completely
    sed -i '/<div class="language-dropdown">/,/<\/div>/d' "$file"
    
    # Step 2: Fix mobile menu button closing tag (change </a> to </button>)
    sed -i 's/<\/a>$/<\/button>/' "$file"
    
    # Step 3: Add the right side controls wrapper
    # Insert the wrapper before the dark mode toggle
    sed -i '/<!-- Dark Mode Toggle -->/i\
                <!-- Right Side Controls -->\
                <div class="flex items-center space-x-2">' "$file"
    
    # Step 4: Add closing div after mobile menu button
    sed -i '/<!-- Mobile Menu Button -->/,/<\/button>/ {
        /<\/button>/ {
            a\
                    </button>\
                </div>
        }
    }' "$file"
    
    echo "✅ Fixed: $file"
}

# Get all HTML files
echo "📁 Finding all HTML files..."
html_files=$(find . -name "*.html" -type f)

# Count total files
total_files=$(echo "$html_files" | wc -l)
echo "📊 Total HTML files found: $total_files"

# Process each file
counter=0
processed=0
for file in $html_files; do
    counter=$((counter + 1))
    echo "[$counter/$total_files] Processing: $file"
    
    # Skip backup files
    if [[ "$file" == *.backup ]]; then
        echo "⏭️  Skipping backup file: $file"
        continue
    fi
    
    # Check if file contains navigation elements
    if grep -q "darkModeToggle\|mobileMenuButton\|language-dropdown" "$file"; then
        fix_file "$file"
        processed=$((processed + 1))
    else
        echo "⏭️  Skipping file without navigation: $file"
    fi
done

echo ""
echo "✅ Navigation layout fix completed!"
echo "📊 Total files: $total_files"
echo "🔧 Files processed: $processed"
echo "🎯 Language dropdowns removed"
echo "🔗 Dark mode toggle and mobile menu button grouped together"
echo "🔧 Mobile menu button closing tags fixed"

# Clean up backup files
echo "🧹 Cleaning up backup files..."
find . -name "*.backup" -delete
echo "✅ Backup files removed" 