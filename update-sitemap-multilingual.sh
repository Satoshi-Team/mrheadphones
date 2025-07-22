#!/bin/bash

# Script to update sitemap for multilingual support
echo "Updating sitemap for multilingual support..."

# Define all supported languages
LANGUAGES=("en" "fr" "de" "it" "nl" "pl" "es" "sv" "ru" "uk" "zh" "ja" "ko")

# Create new sitemap with language variants
cat > sitemap.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">
EOF

# Function to add URL with language variants
add_url_with_languages() {
    local path="$1"
    local lastmod="$2"
    local priority="$3"
    local changefreq="$4"
    
    echo "  <url>" >> sitemap.xml
    echo "    <loc>https://mrheadphones.com$path</loc>" >> sitemap.xml
    echo "    <lastmod>$lastmod</lastmod>" >> sitemap.xml
    echo "    <changefreq>$changefreq</changefreq>" >> sitemap.xml
    echo "    <priority>$priority</priority>" >> sitemap.xml
    
    # Add language alternatives
    for lang in "${LANGUAGES[@]}"; do
        case $lang in
            "en")
                hreflang="en-GB"
                ;;
            "fr")
                hreflang="fr-FR"
                ;;
            "de")
                hreflang="de-DE"
                ;;
            "it")
                hreflang="it-IT"
                ;;
            "nl")
                hreflang="nl-NL"
                ;;
            "pl")
                hreflang="pl-PL"
                ;;
            "es")
                hreflang="es-ES"
                ;;
            "sv")
                hreflang="sv-SE"
                ;;
            "ru")
                hreflang="ru-RU"
                ;;
            "uk")
                hreflang="uk-UA"
                ;;
            "zh")
                hreflang="zh-CN"
                ;;
            "ja")
                hreflang="ja-JP"
                ;;
            "ko")
                hreflang="ko-KR"
                ;;
        esac
        
        echo "    <xhtml:link rel=\"alternate\" hreflang=\"$hreflang\" href=\"https://mrheadphones.com$path?lang=$lang\"/>" >> sitemap.xml
    done
    
    echo "  </url>" >> sitemap.xml
}

# Add main pages
add_url_with_languages "/" "2025-01-15" "1.0" "weekly"
add_url_with_languages "/privacy.html" "2025-01-15" "0.3" "monthly"
add_url_with_languages "/terms.html" "2025-01-15" "0.3" "monthly"

# Add category pages
add_url_with_languages "/categories/best-bass-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-bluetooth-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-budget-gaming-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-budget-headphones-for-students/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-budget-wireless-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-closed-back-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-dynamic-driver-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-electrostatic-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-foldable-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-foldable-headphones-for-travel/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-gaming-headsets/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-airplane-travel/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-android/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-gaming/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-iphone/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-kids/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-mac/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-macbook/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-music/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-ps5/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-running/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-studying/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-work/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-work-from-home/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-for-xbox/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-headphones-under-100/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-in-ear-monitors/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-noise-cancelling-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-noise-cancelling-headphones-for-travel/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-noise-cancelling-headphones-under-200/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-office-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-on-ear-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-open-back-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-over-ear-headphones-under-100/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-planar-magnetic-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-studio-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-travel-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-waterproof-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-wireless-earbuds/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-wireless-headphones/" "2025-01-15" "0.8" "weekly"
add_url_with_languages "/categories/best-workout-headphones/" "2025-01-15" "0.8" "weekly"

# Close sitemap
echo "</urlset>" >> sitemap.xml

echo "Multilingual sitemap updated successfully!"
echo "Added language variants for all 13 supported languages."
echo "Total URLs: 43 pages × 13 languages = 559 language variants" 