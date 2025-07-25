#!/bin/bash

echo "🔧 Fixing missing closing div tags for card-hover elements..."

# Function to fix card structures in a file
fix_card_closing_tags() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Use awk to properly close card-hover elements
    awk '
    BEGIN { 
        in_card_hover = 0
        card_content = ""
        div_stack = 0
    }
    
    # Start of card-hover
    /<div class="card-hover">/ {
        in_card_hover = 1
        card_content = $0
        div_stack = 1
        next
    }
    
    # Inside card-hover
    in_card_hover {
        card_content = card_content "\n" $0
        
        # Count div tags
        if ($0 ~ /<div[^>]*>/) div_stack++
        if ($0 ~ /<\/div>/) div_stack--
        
        # If we reach the end of the card-hover content (before next card-hover or section)
        if (div_stack == 0 && in_card_hover) {
            print card_content
            in_card_hover = 0
            card_content = ""
            next
        }
        
        # If we hit a new section or card-hover without closing the previous one
        if (($0 ~ /<!--/ || $0 ~ /<div class="card-hover">/) && in_card_hover && div_stack > 0) {
            # Add missing closing divs
            while (div_stack > 0) {
                card_content = card_content "\n</div>"
                div_stack--
            }
            print card_content
            in_card_hover = 0
            card_content = ""
            if ($0 ~ /<div class="card-hover">/) {
                in_card_hover = 1
                card_content = $0
                div_stack = 1
            } else {
                print $0
            }
            next
        }
        
        next
    }
    
    # Not in card-hover
    {
        print $0
    }
    
    END {
        # Close any remaining card-hover
        if (in_card_hover && div_stack > 0) {
            while (div_stack > 0) {
                card_content = card_content "\n</div>"
                div_stack--
            }
            print card_content
        }
    }
    ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
    
    echo "✅ Fixed: $file"
}

# Fix all category pages
echo "📁 Processing category pages..."
for file in categories/*/index.html; do
    if [ -f "$file" ]; then
        fix_card_closing_tags "$file"
    fi
done

# Fix all src/pages files
echo "📁 Processing src/pages files..."
for file in src/pages/**/*.html; do
    if [ -f "$file" ]; then
        fix_card_closing_tags "$file"
    fi
done

# Fix main pages
echo "📁 Processing main pages..."
for file in privacy.html terms.html; do
    if [ -f "$file" ]; then
        fix_card_closing_tags "$file"
    fi
done

echo "🎉 All card closing tags have been fixed!" 