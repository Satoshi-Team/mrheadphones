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
    
    # Step 3: Replace the entire navigation structure with the correct one
    # This is more reliable than trying to modify in place
    
    # Create a temporary file
    temp_file=$(mktemp)
    
    # Process the file line by line
    while IFS= read -r line; do
        # If we find the desktop navigation section, replace it
        if [[ "$line" == *"<!-- Desktop Navigation -->"* ]]; then
            echo "                <!-- Desktop Navigation -->" >> "$temp_file"
            echo "                <div class=\"hidden md:flex items-center space-x-8\">" >> "$temp_file"
            echo "                    <a href=\"#home\" class=\"nav-link\">Home</a>" >> "$temp_file"
            echo "                    <a href=\"#categories\" class=\"nav-link\">Categories</a>" >> "$temp_file"
            echo "                    <a href=\"#devices\" class=\"nav-link\">Devices</a>" >> "$temp_file"
            echo "                    <a href=\"#solutions\" class=\"nav-link\">Solutions</a>" >> "$temp_file"
            echo "                    <a href=\"#budget\" class=\"nav-link\">Budget</a>" >> "$temp_file"
            echo "                </div>" >> "$temp_file"
            echo "" >> "$temp_file"
            echo "                <!-- Right Side Controls -->" >> "$temp_file"
            echo "                <div class=\"flex items-center space-x-2\">" >> "$temp_file"
            echo "                    <!-- Dark Mode Toggle -->" >> "$temp_file"
            
            # Skip the old desktop navigation lines
            while IFS= read -r skip_line; do
                if [[ "$skip_line" == *"</div>"* ]] && [[ "$skip_line" == *"hidden md:flex"* ]]; then
                    break
                fi
            done
            
            # Continue reading until we find the dark mode toggle
            while IFS= read -r skip_line; do
                if [[ "$skip_line" == *"<!-- Dark Mode Toggle -->"* ]]; then
                    break
                fi
            done
            
            # Now read and output the dark mode toggle content
            while IFS= read -r toggle_line; do
                if [[ "$toggle_line" == *"<!-- Mobile Menu Button -->"* ]]; then
                    echo "                    </button>" >> "$temp_file"
                    echo "" >> "$temp_file"
                    echo "                    <!-- Mobile Menu Button -->" >> "$temp_file"
                    break
                fi
                echo "                    $toggle_line" >> "$temp_file"
            done
            
            # Now read and output the mobile menu button content
            while IFS= read -r button_line; do
                if [[ "$button_line" == *"</button>"* ]] && [[ "$button_line" == *"mobileMenuButton"* ]]; then
                    echo "                    $button_line" >> "$temp_file"
                    echo "                </div>" >> "$temp_file"
                    break
                fi
                echo "                    $button_line" >> "$temp_file"
            done
            
        else
            # Output all other lines unchanged
            echo "$line" >> "$temp_file"
        fi
    done < "$file"
    
    # Replace the original file
    mv "$temp_file" "$file"
    
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