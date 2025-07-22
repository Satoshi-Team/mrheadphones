#!/bin/bash

# Script to update sitemap for multilingual support with proper URL routing
echo "Updating sitemap for multilingual support with proper URL routing..."

# Create sitemap header
cat > sitemap.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">
EOF

# Language codes and their hreflang values
LANGUAGES=("en" "fr" "de" "it" "nl" "pl" "es" "sv" "ru" "uk" "zh" "ja" "ko")

# Function to add URL with language variants
add_url_with_languages() {
    local path="$1"
    local lastmod="$2"
    
    echo "  <url>" >> sitemap.xml
    echo "    <loc>https://mrheadphones.com$path</loc>" >> sitemap.xml
    echo "    <lastmod>$lastmod</lastmod>" >> sitemap.xml
    echo "    <changefreq>weekly</changefreq>" >> sitemap.xml
    echo "    <priority>1.0</priority>" >> sitemap.xml
    
    # Add hreflang links for each language
    for lang in "${LANGUAGES[@]}"; do
        case $lang in
            "en")
                hreflang="en-GB"
                url="https://mrheadphones.com$path"
                ;;
            "fr")
                hreflang="fr-FR"
                url="https://mrheadphones.com/fr$path"
                ;;
            "de")
                hreflang="de-DE"
                url="https://mrheadphones.com/de$path"
                ;;
            "it")
                hreflang="it-IT"
                url="https://mrheadphones.com/it$path"
                ;;
            "nl")
                hreflang="nl-NL"
                url="https://mrheadphones.com/nl$path"
                ;;
            "pl")
                hreflang="pl-PL"
                url="https://mrheadphones.com/pl$path"
                ;;
            "es")
                hreflang="es-ES"
                url="https://mrheadphones.com/es$path"
                ;;
            "sv")
                hreflang="sv-SE"
                url="https://mrheadphones.com/sv$path"
                ;;
            "ru")
                hreflang="ru-RU"
                url="https://mrheadphones.com/ru$path"
                ;;
            "uk")
                hreflang="uk-UA"
                url="https://mrheadphones.com/uk$path"
                ;;
            "zh")
                hreflang="zh-CN"
                url="https://mrheadphones.com/zh$path"
                ;;
            "ja")
                hreflang="ja-JP"
                url="https://mrheadphones.com/ja$path"
                ;;
            "ko")
                hreflang="ko-KR"
                url="https://mrheadphones.com/ko$path"
                ;;
        esac
        
        echo "    <xhtml:link rel=\"alternate\" hreflang=\"$hreflang\" href=\"$url\"/>" >> sitemap.xml
    done
    
    echo "  </url>" >> sitemap.xml
}

# Get current date in ISO format
CURRENT_DATE=$(date -u +"%Y-%m-%d")

# Add main pages
add_url_with_languages "/" "$CURRENT_DATE"
add_url_with_languages "/privacy.html" "$CURRENT_DATE"
add_url_with_languages "/terms.html" "$CURRENT_DATE"

# Add category pages
for dir in categories/*/; do
    if [ -d "$dir" ]; then
        # Extract category name from directory
        category_name=$(basename "$dir")
        add_url_with_languages "/categories/$category_name/" "$CURRENT_DATE"
    fi
done

# Close sitemap
echo "</urlset>" >> sitemap.xml

echo "Sitemap updated successfully!"
echo "Generated sitemap with $((${#LANGUAGES[@]} * $(find categories -type d | wc -l) + ${#LANGUAGES[@]} * 3)) URLs"
echo "Language variants: ${LANGUAGES[*]}" 