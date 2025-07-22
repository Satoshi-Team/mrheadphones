#!/bin/bash

# Final, reliable fix for navigation layout across all HTML files
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
    
    # Step 3: Add the right side controls wrapper around existing elements
    # Insert the wrapper before the dark mode toggle
    sed -i '/<!-- Dark Mode Toggle -->/i\
                <!-- Right Side Controls -->\
                <div class="flex items-center space-x-2">\
                    <!-- Dark Mode Toggle -->' "$file"
    
    # Step 4: Add closing div after mobile menu button
    sed -i '/<!-- Mobile Menu Button -->/,/<\/button>/ {
        /<\/button>/ {
            a\
                    </button>\
                </div>
        }
    }' "$file"
    
    # Step 5: Fix indentation for dark mode toggle and mobile menu button
    sed -i '/<!-- Dark Mode Toggle -->/,/<!-- Mobile Menu Button -->/ {
        s/^                <!-- Dark Mode Toggle -->/                    <!-- Dark Mode Toggle -->/
        s/^                <button id="darkModeToggle"/                    <button id="darkModeToggle"/
        s/^                    <span class="dark:hidden">/                        <span class="dark:hidden">/
        s/^                        <svg class="w-5 h-5"/                            <svg class="w-5 h-5"/
        s/^                            <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"\/>/                                <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"\/>/
        s/^                        <\/svg>/                            <\/svg>/
        s/^                    <\/span>/                        <\/span>/
        s/^                    <span class="hidden dark:inline">/                        <span class="hidden dark:inline">/
        s/^                        <svg class="w-5 h-5"/                            <svg class="w-5 h-5"/
        s/^                            <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"\/>/                                <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"\/>/
        s/^                        <\/svg>/                            <\/svg>/
        s/^                    <\/span>/                        <\/span>/
        s/^                <\/button>/                    <\/button>/
    }' "$file"
    
    # Step 6: Fix indentation for mobile menu button
    sed -i '/<!-- Mobile Menu Button -->/,/<\/button>/ {
        s/^                <!-- Mobile Menu Button -->/                    <!-- Mobile Menu Button -->/
        s/^                <button id="mobileMenuButton"/                    <button id="mobileMenuButton"/
        s/^                    <svg class="w-6 h-6"/                        <svg class="w-6 h-6"/
        s/^                        <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"\/>/                            <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"\/>/
        s/^                    <\/svg>/                        <\/svg>/
        s/^                <\/button>/                    <\/button>/
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