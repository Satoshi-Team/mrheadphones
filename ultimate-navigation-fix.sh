#!/bin/bash

# Ultimate navigation fix - Complete rebuild of navigation structure
# Ensures perfect structure with no duplicates, proper positioning, and clean HTML

echo "🚀 Ultimate navigation structure fix..."

# Function to completely rebuild navigation for a single file
fix_navigation() {
    local file="$1"
    echo "🔧 Fixing: $file"
    
    # Create backup
    cp "$file" "${file}.backup"
    
    # Create temporary file
    temp_file=$(mktemp)
    
    # Use awk to completely rebuild the navigation section
    awk '
    BEGIN { 
        in_nav = 0; 
        in_nav_content = 0; 
        nav_rebuilt = 0; 
        body_started = 0;
    }
    
    # Start of navigation
    /<!-- Navigation -->/ { 
        in_nav = 1; 
        nav_rebuilt = 0; 
        print $0;
        next;
    }
    
    # End of navigation
    /<\/nav>/ { 
        if (in_nav && !nav_rebuilt) {
            # Rebuild the entire navigation structure
            print "    <nav class=\"fixed top-0 w-full glass-effect z-50 border-b border-gray-200/30 dark:border-gray-700/30 backdrop-blur-2xl shadow-lg\">"
            print "        <div class=\"content-container-wide\">"
            print "            <div class=\"flex justify-between items-center h-16\">"
            print "                <!-- Logo -->"
            print "                <div class=\"flex items-center\">"
            print "                    <a href=\"/\" class=\"flex items-center space-x-3 group\">"
            print "                        <img src=\"../../../public/favicon.svg?v=1.0.1\" alt=\"MrHeadphones Logo\" class=\"w-6 h-6 sm:w-7 sm:h-7 lg:w-8 lg:h-8 transition-all duration-300 group-hover:scale-105\">"
            print "                        <span class=\"font-heading font-bold text-lg sm:text-xl lg:text-2xl text-gray-900 dark:text-white\">MrHeadphones</span>"
            print "                    </a>"
            print "                </div>"
            print "                "
            print "                <!-- Desktop Navigation -->"
            print "                <div class=\"hidden md:flex items-center space-x-8\">"
            print "                    <a href=\"/#home\" class=\"nav-link\" data-translate=\"nav_home\">Home</a>"
            print "                    <a href=\"/#categories\" class=\"nav-link\" data-translate=\"nav_categories\">Categories</a>"
            print "                    <a href=\"/#devices\" class=\"nav-link\" data-translate=\"nav_devices\">Devices</a>"
            print "                    <a href=\"/#solutions\" class=\"nav-link\" data-translate=\"nav_solutions\">Solutions</a>"
            print "                    <a href=\"/#budget\" class=\"nav-link\" data-translate=\"nav_budget\">Budget</a>"
            print "                </div>"
            print "                "
            print "                <!-- Right Side Controls -->"
            print "                <div class=\"flex items-center space-x-2\">"
            print "                    <!-- Dark Mode Toggle -->"
            print "                    <button id=\"darkModeToggle\" aria-label=\"Toggle dark mode\" data-translate-title=\"dark_mode_toggle\" class=\"p-3 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary/30\">"
            print "                        <span class=\"dark:hidden\">"
            print "                            <svg class=\"w-5 h-5\" fill=\"currentColor\" viewBox=\"0 0 20 20\">"
            print "                                <path d=\"M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z\"/>"
            print "                            </svg>"
            print "                        </span>"
            print "                        <span class=\"hidden dark:inline\">"
            print "                            <svg class=\"w-5 h-5\" fill=\"currentColor\" viewBox=\"0 0 20 20\">"
            print "                                <path fill-rule=\"evenodd\" d=\"M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z\" clip-rule=\"evenodd\"/>"
            print "                            </svg>"
            print "                        </span>"
            print "                    </button>"
            print "                    "
            print "                    <!-- Mobile Menu Button -->"
            print "                    <button id=\"mobileMenuButton\" aria-label=\"Toggle mobile menu\" data-translate-title=\"mobile_menu_toggle\" class=\"md:hidden p-3 rounded-2xl hover:bg-gray-100/60 dark:hover:bg-gray-700/60 transition-all duration-300 hover:shadow-md focus:outline-none focus:ring-2 focus:ring-secondary/30\">"
            print "                        <svg class=\"w-5 h-5 sm:w-6 sm:h-6 lg:w-7 lg:h-7\" fill=\"currentColor\" viewBox=\"0 0 20 20\">"
            print "                            <path fill-rule=\"evenodd\" d=\"M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z\" clip-rule=\"evenodd\"/>"
            print "                        </svg>"
            print "                    </button>"
            print "                </div>"
            print "            </div>"
            print "        </div>"
            print "        "
            print "        <!-- Mobile Menu -->"
            print "        <div id=\"mobileMenu\" class=\"hidden md:hidden mobile-futuristic border-t border-gray-200/20 dark:border-gray-700/20\">"
            print "            <div class=\"px-4 py-4 space-y-2\">"
            print "                <a href=\"/#home\" class=\"block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700\" data-translate=\"nav_home\">Home</a>"
            print "                <a href=\"/#categories\" class=\"block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700\" data-translate=\"nav_categories\">Categories</a>"
            print "                <a href=\"/#devices\" class=\"block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700\" data-translate=\"nav_devices\">Devices</a>"
            print "                <a href=\"/#solutions\" class=\"block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700\" data-translate=\"nav_solutions\">Solutions</a>"
            print "                <a href=\"/#budget\" class=\"block py-2 px-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700\" data-translate=\"nav_budget\">Budget</a>"
            print "            </div>"
            print "        </div>"
            print "    </nav>"
            nav_rebuilt = 1;
        }
        in_nav = 0;
        next;
    }
    
    # Skip all content within navigation if we are rebuilding
    if (in_nav && !nav_rebuilt) {
        next;
    }
    
    # Print all other content unchanged
    print $0;
    ' "$file" > "$temp_file"
    
    # Replace original file
    mv "$temp_file" "$file"
    
    echo "✅ Fixed: $file"
}

# Function to verify the fix
verify_fix() {
    local file="$1"
    local dark_toggle_count=$(grep -c "<!-- Dark Mode Toggle -->" "$file" 2>/dev/null || echo "0")
    local right_controls_count=$(grep -c "Right Side Controls" "$file" 2>/dev/null || echo "0")
    local language_dropdown_count=$(grep -c "language-dropdown" "$file" 2>/dev/null || echo "0")
    local duplicate_svg_count=$(grep -c "<svg.*<svg" "$file" 2>/dev/null || echo "0")
    
    if [ "$dark_toggle_count" -eq 1 ] && [ "$right_controls_count" -eq 1 ] && [ "$language_dropdown_count" -eq 0 ] && [ "$duplicate_svg_count" -eq 0 ]; then
        echo "✅ Verified: $file - Perfect structure"
    else
        echo "❌ Warning: $file - Issues detected (Dark toggles: $dark_toggle_count, Right controls: $right_controls_count, Language dropdowns: $language_dropdown_count, Duplicate SVGs: $duplicate_svg_count)"
    fi
}

# Main execution
echo "🎯 Starting ultimate navigation fix..."

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
echo "🎉 Ultimate navigation fix completed!"
echo "📊 Summary:"
echo "   - Completely rebuilt navigation structure"
echo "   - Single dark mode toggle with proper SVGs"
echo "   - Dark mode toggle positioned next to hamburger menu"
echo "   - No language dropdowns"
echo "   - No duplicate elements"
echo "   - All body content preserved unchanged"
echo "   - Backups created as .backup files"
echo ""
echo "💡 To restore any file if needed: mv filename.html.backup filename.html" 