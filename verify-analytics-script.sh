#!/bin/bash

echo "🔍 Verifying Google Analytics script on all HTML files..."

# Google Analytics script to add
ANALYTICS_SCRIPT='<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-89QWFC1J9M"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('\''js'\'', new Date());

  gtag('\''config'\'', '\''G-89QWFC1J9M'\'');
</script>'

# Find all HTML files
HTML_FILES=$(find . -name "*.html" -type f)

# Counters
TOTAL_FILES=0
FILES_WITH_ANALYTICS=0
FILES_WITHOUT_ANALYTICS=0

echo "📊 Checking HTML files for Google Analytics script..."

for file in $HTML_FILES; do
    TOTAL_FILES=$((TOTAL_FILES + 1))
    
    # Check if file contains the tracking ID
    if grep -q "G-89QWFC1J9M" "$file"; then
        FILES_WITH_ANALYTICS=$((FILES_WITH_ANALYTICS + 1))
        echo "✅ $file - Analytics script found"
    else
        FILES_WITHOUT_ANALYTICS=$((FILES_WITHOUT_ANALYTICS + 1))
        echo "❌ $file - Analytics script missing"
        
        # Create backup
        cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
        
        # Add analytics script after the favicon line
        if grep -q "favicon.svg" "$file"; then
            # Insert after favicon line
            sed -i '/favicon.svg/a\
    '"$ANALYTICS_SCRIPT"'
' "$file"
            echo "   ➕ Added analytics script to $file"
        else
            # Insert after head tag if no favicon found
            sed -i '/<head>/a\
    '"$ANALYTICS_SCRIPT"'
' "$file"
            echo "   ➕ Added analytics script to $file (after head tag)"
        fi
    fi
done

echo ""
echo "📈 Analytics Script Verification Summary:"
echo "=========================================="
echo "Total HTML files found: $TOTAL_FILES"
echo "Files with analytics script: $FILES_WITH_ANALYTICS"
echo "Files without analytics script: $FILES_WITHOUT_ANALYTICS"

if [ $FILES_WITHOUT_ANALYTICS -eq 0 ]; then
    echo ""
    echo "🎉 SUCCESS: All HTML files have the Google Analytics script!"
    echo "   Tracking ID: G-89QWFC1J9M"
else
    echo ""
    echo "⚠️  WARNING: $FILES_WITHOUT_ANALYTICS files were missing the analytics script"
    echo "   Scripts have been added to the missing files"
fi

echo ""
echo "✅ Verification complete!" 