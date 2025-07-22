#!/bin/bash

# Script to create translation files for all supported languages
echo "Creating translation files for all supported languages..."

# Define all supported languages
declare -A LANGUAGES=(
  ["fr"]="French"
  ["de"]="German"
  ["it"]="Italian"
  ["nl"]="Dutch"
  ["pl"]="Polish"
  ["es"]="Spanish"
  ["sv"]="Swedish"
  ["ru"]="Russian"
  ["uk"]="Ukrainian"
  ["zh"]="Chinese"
  ["ja"]="Japanese"
  ["ko"]="Korean"
)

# Function to create a translation file
create_translation() {
    local lang_code="$1"
    local lang_name="$2"
    
    echo "Creating translation for $lang_name ($lang_code)..."
    
    # Create the translation file
    cat > "translations/${lang_code}.json" << EOF
{
  "meta_title": "MrHeadphones.com - Trouvez Vos Écouteurs Parfaits",
  "meta_description": "Découvrez les meilleurs écouteurs pour tous les besoins. Avis d'experts, comparaisons et recommandations pour le gaming, la musique, le travail et plus encore.",
  
  "nav_home": "Accueil",
  "nav_categories": "Catégories",
  "nav_devices": "Appareils",
  "nav_solutions": "Solutions",
  "nav_budget": "Budget",
  
  "hero_title": "Trouvez Vos Écouteurs Parfaits",
  "hero_subtitle": "Avis d'experts et recommandations pour tous les besoins, du gaming à la musique au travail.",
  "hero_cta_primary": "Explorer les Catégories",
  "hero_cta_secondary": "Comparer les Écouteurs",
  
  "section_categories_title": "Parcourir par Catégorie",
  "section_categories_subtitle": "Trouvez des écouteurs adaptés à vos besoins et préférences spécifiques.",
  
  "section_devices_title": "Parcourir par Appareil",
  "section_devices_subtitle": "Trouvez des écouteurs optimisés pour vos appareils et plateformes préférés.",
  
  "section_solutions_title": "Parcourir par Solution",
  "section_solutions_subtitle": "Trouvez des écouteurs conçus pour des cas d'usage et environnements spécifiques.",
  
  "section_budget_title": "Parcourir par Budget",
  "section_budget_subtitle": "Trouvez d'excellents écouteurs à tous les prix.",
  
  "footer_about": "MrHeadphones.com est une plateforme de découverte d'écouteurs centrée sur l'utilisateur qui vous aide à trouver la paire idéale basée sur des tests réels, des recherches d'experts et des performances audio pour tous les besoins.",
  "footer_quick_links": "Liens Rapides",
  "footer_connect": "Se Connecter",
  "footer_copyright": "© 2025 MrHeadphones.com. Tous droits réservés.",
  
  "btn_read_more": "Lire Plus",
  "btn_compare": "Comparer",
  "btn_compare_now": "Comparer Maintenant",
  "btn_explore": "Explorer",
  "btn_learn_more": "En Savoir Plus",
  "btn_view_all": "Voir Tout",
  "btn_submit": "Soumettre",
  "btn_send": "Envoyer",
  "btn_contact": "Contact",
  "btn_about": "À Propos",
  "btn_privacy": "Confidentialité",
  "btn_terms": "Conditions",
  "btn_email": "Email",
  
  "category_best_bass_headphones": "Meilleurs Écouteurs Bass",
  "category_best_bass_headphones_desc": "Bass puissant pour les amateurs de musique.",
  
  "category_best_bluetooth_headphones": "Meilleurs Écouteurs Bluetooth",
  "category_best_bluetooth_headphones_desc": "Liberté sans fil avec un excellent son.",
  
  "category_best_budget_gaming_headphones": "Meilleurs Écouteurs Gaming Budget",
  "category_best_budget_gaming_headphones_desc": "Solutions audio gaming abordables.",
  
  "category_best_budget_headphones_for_students": "Meilleurs Écouteurs Budget pour Étudiants",
  "category_best_budget_headphones_for_students_desc": "Audio de qualité avec un budget étudiant.",
  
  "category_best_budget_wireless_headphones": "Meilleurs Écouteurs Sans Fil Budget",
  "category_best_budget_wireless_headphones_desc": "Confort sans fil sans se ruiner.",
  
  "category_best_closed_back_headphones": "Meilleurs Écouteurs Fermés",
  "category_best_closed_back_headphones_desc": "Isolation et intimité pour une écoute concentrée.",
  
  "category_best_dynamic_driver_headphones": "Meilleurs Écouteurs à Transducteur Dynamique",
  "category_best_dynamic_driver_headphones_desc": "Son classique avec technologie moderne.",
  
  "category_best_electrostatic_headphones": "Meilleurs Écouteurs Électrostatiques",
  "category_best_electrostatic_headphones_desc": "Précision et clarté ultimes.",
  
  "category_best_foldable_headphones": "Meilleurs Écouteurs Pliables",
  "category_best_foldable_headphones_desc": "Confort portable pour les voyageurs.",
  
  "category_best_foldable_headphones_for_travel": "Meilleurs Écouteurs Pliables pour Voyage",
  "category_best_foldable_headphones_for_travel_desc": "Compagnons audio compacts pour vos voyages.",
  
  "category_best_gaming_headsets": "Meilleurs Casques Gaming",
  "category_best_gaming_headsets_desc": "Solutions audio gaming complètes.",
  
  "category_best_headphones_for_airplane_travel": "Meilleurs Écouteurs pour Voyage en Avion",
  "category_best_headphones_for_airplane_travel_desc": "Confort et isolation sonore pour les vols.",
  
  "category_best_headphones_for_android": "Meilleurs Écouteurs pour Android",
  "category_best_headphones_for_android_desc": "Optimisés pour les appareils Android.",
  
  "category_best_headphones_for_gaming": "Meilleurs Écouteurs Gaming",
  "category_best_headphones_for_gaming_desc": "Guide complet des solutions audio gaming.",
  
  "category_best_headphones_for_iphone": "Meilleurs Écouteurs pour iPhone",
  "category_best_headphones_for_iphone_desc": "Compagnons parfaits pour les appareils Apple.",
  
  "category_best_headphones_for_kids": "Meilleurs Écouteurs pour Enfants",
  "category_best_headphones_for_kids_desc": "Audio sûr et durable pour les enfants.",
  
  "category_best_headphones_for_mac": "Meilleurs Écouteurs pour Mac",
  "category_best_headphones_for_mac_desc": "Optimisés pour les ordinateurs Mac.",
  
  "category_best_headphones_for_macbook": "Meilleurs Écouteurs pour MacBook",
  "category_best_headphones_for_macbook_desc": "Parfaits pour les utilisateurs MacBook.",
  
  "category_best_headphones_for_music": "Meilleurs Écouteurs pour Musique",
  "category_best_headphones_for_music_desc": "Qualité sonore exceptionnelle pour les amateurs de musique.",
  
  "category_best_headphones_for_ps5": "Meilleurs Écouteurs pour PS5",
  "category_best_headphones_for_ps5_desc": "Choix optimisés pour le gaming PlayStation 5.",
  
  "category_best_headphones_for_running": "Meilleurs Écouteurs pour Course",
  "category_best_headphones_for_running_desc": "Sécurisés et confortables pour les entraînements.",
  
  "category_best_headphones_for_studying": "Meilleurs Écouteurs pour Études",
  "category_best_headphones_for_studying_desc": "Concentration et focus pour la réussite académique.",
  
  "category_best_headphones_for_work": "Meilleurs Écouteurs pour Travail",
  "category_best_headphones_for_work_desc": "Audio professionnel pour la productivité.",
  
  "category_best_headphones_for_work_from_home": "Meilleurs Écouteurs pour Télétravail",
  "category_best_headphones_for_work_from_home_desc": "Confort et clarté pour le travail à distance.",
  
  "category_best_headphones_for_xbox": "Meilleurs Écouteurs pour Xbox",
  "category_best_headphones_for_xbox_desc": "Compagnons audio parfaits pour Xbox Series X/S.",
  
  "category_best_headphones_under_100": "Meilleurs Écouteurs Sous 100€",
  "category_best_headphones_under_100_desc": "Audio de qualité avec un budget limité.",
  
  "category_best_in_ear_monitors": "Meilleurs Moniteurs Intra-Auriculaires",
  "category_best_in_ear_monitors_desc": "Monitoring professionnel et écoute personnelle.",
  
  "category_best_noise_cancelling_headphones": "Meilleurs Écouteurs Anti-Bruit",
  "category_best_noise_cancelling_headphones_desc": "Bloquez le monde autour de vous.",
  
  "category_best_noise_cancelling_headphones_for_travel": "Meilleurs Écouteurs Anti-Bruit pour Voyage",
  "category_best_noise_cancelling_headphones_for_travel_desc": "Paix et tranquillité en déplacement.",
  
  "category_best_noise_cancelling_headphones_under_200": "Meilleurs Écouteurs Anti-Bruit Sous 200€",
  "category_best_noise_cancelling_headphones_under_200_desc": "Anti-bruit abordable.",
  
  "category_best_office_headphones": "Meilleurs Écouteurs de Bureau",
  "category_best_office_headphones_desc": "Audio professionnel pour le lieu de travail.",
  
  "category_best_on_ear_headphones": "Meilleurs Écouteurs Sur-Oreilles",
  "category_best_on_ear_headphones_desc": "Confort léger et portabilité.",
  
  "category_best_open_back_headphones": "Meilleurs Écouteurs Ouverts",
  "category_best_open_back_headphones_desc": "Scène sonore naturelle et écoute aérée.",
  
  "category_best_over_ear_headphones_under_100": "Meilleurs Écouteurs Circum-Auriculaires Sous 100€",
  "category_best_over_ear_headphones_under_100_desc": "Écoute confortable avec un budget limité.",
  
  "category_best_planar_magnetic_headphones": "Meilleurs Écouteurs Planaires Magnétiques",
  "category_best_planar_magnetic_headphones_desc": "Technologie avancée pour audiophiles.",
  
  "category_best_studio_headphones": "Meilleurs Écouteurs de Studio",
  "category_best_studio_headphones_desc": "Monitoring et mixage professionnels.",
  
  "category_best_travel_headphones": "Meilleurs Écouteurs de Voyage",
  "category_best_travel_headphones_desc": "Audio portable pour vos aventures.",
  
  "category_best_waterproof_headphones": "Meilleurs Écouteurs Imperméables",
  "category_best_waterproof_headphones_desc": "Audio durable pour les modes de vie actifs.",
  
  "category_best_wireless_earbuds": "Meilleurs Écouteurs Sans Fil",
  "category_best_wireless_earbuds_desc": "Liberté sans fil véritable et commodité.",
  
  "category_best_wireless_headphones": "Meilleurs Écouteurs Sans Fil",
  "category_best_wireless_headphones_desc": "Coupez le câble sans perdre en qualité.",
  
  "category_best_workout_headphones": "Meilleurs Écouteurs d'Entraînement",
  "category_best_workout_headphones_desc": "Audio résistant à la sueur pour le fitness.",
  
  "faq_title": "Questions Fréquemment Posées",
  "related_articles_title": "Articles Connexes",
  
  "privacy_title": "Politique de Confidentialité",
  "privacy_subtitle": "Votre confidentialité est importante pour nous. Cette politique explique comment nous collectons, utilisons et protégeons vos informations.",
  
  "terms_title": "Conditions d'Utilisation",
  "terms_subtitle": "Veuillez lire attentivement ces conditions avant d'utiliser notre site web.",
  
  "contact_email": "hello@mrheadphones.com",
  "contact_address": "Wyoming, United States",
  "contact_website": "mrheadphones.com",
  
  "dark_mode_toggle": "Basculer le mode sombre",
  "mobile_menu_toggle": "Basculer le menu mobile",
  
  "loading": "Chargement...",
  "error_loading": "Erreur de chargement du contenu",
  "no_results": "Aucun résultat trouvé",
  "back_to_top": "Retour en haut"
}
EOF

    echo "Created: translations/${lang_code}.json"
}

# Create translations for all languages
for lang_code in "${!LANGUAGES[@]}"; do
    create_translation "$lang_code" "${LANGUAGES[$lang_code]}"
done

echo "All translation files created successfully!"
echo "Note: These are placeholder translations. You should review and improve them for accuracy." 