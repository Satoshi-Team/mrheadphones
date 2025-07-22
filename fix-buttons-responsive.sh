#!/bin/bash

# Script to fix gigantic buttons and make them responsive and beautiful
echo "Fixing gigantic buttons with responsive, beautiful CTA buttons..."

# Function to fix a single HTML file
fix_file() {
    local file="$1"
    
    # Fix hero section buttons (make them large but not gigantic)
    sed -i 's/class="btn-primary text-lg px-8 py-4"/class="btn-primary btn-lg"/g' "$file"
    sed -i 's/class="btn-secondary text-lg px-8 py-4"/class="btn-secondary btn-lg"/g' "$file"
    
    # Fix product card buttons (replace gigantic full-width buttons with responsive ones)
    sed -i 's/class="btn-primary w-full text-center block"/class="btn-product"/g' "$file"
    
    # Fix form submit buttons (make them appropriately sized)
    sed -i 's/class="btn-primary text-lg px-8 py-3"/class="btn-primary"/g' "$file"
    
    # Fix any remaining gigantic buttons with large padding
    sed -i 's/class="btn-primary.*px-8.*py-4"/class="btn-primary btn-lg"/g' "$file"
    sed -i 's/class="btn-secondary.*px-8.*py-4"/class="btn-secondary btn-lg"/g' "$file"
    
    # Fix any remaining full-width buttons in cards
    sed -i 's/class="btn-primary.*w-full.*text-center.*block"/class="btn-product"/g' "$file"
    
    # Fix any remaining large padding buttons
    sed -i 's/class="btn-primary.*px-6.*py-3"/class="btn-primary"/g' "$file"
    sed -i 's/class="btn-secondary.*px-6.*py-3"/class="btn-secondary"/g' "$file"
    
    echo "Fixed buttons in: $file"
}

# Process all category directories
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        html_file="$dir/index.html"
        if [ -f "$html_file" ]; then
            fix_file "$html_file"
        fi
    fi
done

# Process all HTML files in src/pages/categories/
for html_file in src/pages/categories/*.html; do
    if [ -f "$html_file" ]; then
        fix_file "$html_file"
    fi
done

# Also fix the main index.html file
if [ -f "index.html" ]; then
    fix_file "index.html"
fi

# Fix privacy.html and terms.html if they exist
if [ -f "privacy.html" ]; then
    fix_file "privacy.html"
fi

if [ -f "terms.html" ]; then
    fix_file "terms.html"
fi

echo "Button fixes completed!"
echo "All buttons now use:"
echo "- btn-primary/btn-secondary: Responsive, appropriately sized buttons"
echo "- btn-lg: Large buttons for hero sections"
echo "- btn-product: Optimized buttons for product cards"
echo "- btn-sm: Small buttons for compact spaces"
echo "- btn-ghost: Subtle ghost buttons for secondary actions" 