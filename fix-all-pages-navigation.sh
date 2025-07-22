#!/bin/bash

# Comprehensive fix for navigation layout across all HTML files
# Remove language dropdown and group dark mode toggle with mobile menu button

echo "🔧 Fixing navigation layout across ALL HTML files..."

# Function to fix a single file
fix_file() {
    local file="$1"
    echo "📝 Fixing: $file"
    
    # Create a backup of the original file
    cp "$file" "${file}.backup"
    
    # Step 1: Remove language dropdown section
    sed -i '/<div class="language-dropdown">/,/<\/div>/d' "$file"
    
    # Step 2: Fix mobile menu button closing tag (change </a> to </button>)
    sed -i 's/<\/a>$/<\/button>/' "$file"
    
    # Step 3: Add the grouped structure around existing dark mode toggle and mobile menu button
    # First, find the desktop navigation section and add the right side controls after it
    sed -i '/<!-- Desktop Navigation -->/,/<\/div>/ {
        /<\/div>/ {
            a\
                <!-- Right Side Controls -->\
                <div class="flex items-center space-x-2">\
                    <!-- Dark Mode Toggle -->
        }
    }' "$file"
    
    # Step 4: Wrap the dark mode toggle in the new structure
    sed -i '/<!-- Dark Mode Toggle -->/,/<\/button>/ {
        /<!-- Dark Mode Toggle -->/ {
            s/<!-- Dark Mode Toggle -->/                    <!-- Dark Mode Toggle -->/
        }
    }' "$file"
    
    # Step 5: Wrap the mobile menu button in the new structure
    sed -i '/<!-- Mobile Menu Button -->/,/<\/button>/ {
        /<!-- Mobile Menu Button -->/ {
            s/<!-- Mobile Menu Button -->/                    <!-- Mobile Menu Button -->/
        }
        /<\/button>/ {
            a\
                    </button>\
                </div>
        }
    }' "$file"
    
    # Step 6: Clean up any duplicate closing divs
    sed -i '/^                <\/div>$/d' "$file"
    
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
    else
        echo "⏭️  Skipping file without navigation: $file"
    fi
done

echo ""
echo "✅ Navigation layout fix completed across all files!"
echo "📊 Processed $counter files"
echo "🎯 Language dropdowns removed"
echo "🔗 Dark mode toggle and mobile menu button grouped together"
echo "🔧 Mobile menu button closing tags fixed"

# Optional: Remove backup files
read -p "🗑️  Remove backup files? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🧹 Removing backup files..."
    find . -name "*.backup" -delete
    echo "✅ Backup files removed"
else
    echo "💾 Backup files preserved"
fi 