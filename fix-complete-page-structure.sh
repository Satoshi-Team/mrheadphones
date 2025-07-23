#!/bin/bash

echo "🔧 Adding complete page structure to all category pages..."

# Function to add missing sections to a page
add_complete_structure() {
    local file="$1"
    local category_name="$2"
    local features_title="$3"
    local faq_questions="$4"
    local related_articles="$5"
    
    echo "Adding complete structure to: $file"
    
    # Find the end of the "What Makes Great..." section and add the missing content
    # Replace the closing div and script tags with the complete structure
    
    # Create a temporary file with the complete structure
    cat > "${file}.temp" << EOF
            <!-- Features Section -->
            <div class="mb-12">
                <h2 class="font-heading font-bold text-2xl sm:text-3xl mb-8 text-center">
                    ${features_title}
                </h2>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div class="card-hover">
                        <h3 class="font-heading font-semibold text-lg mb-3">Noise Isolation</h3>
                        <p class="text-gray-600 dark:text-gray-300">
                            Look for headphones with effective noise cancellation or passive noise isolation to block out distracting background sounds during study sessions.
                        </p>
                    </div>
                    
                    <div class="card-hover">
                        <h3 class="font-heading font-semibold text-lg mb-3">Comfort</h3>
                        <p class="text-gray-600 dark:text-gray-300">
                            Choose headphones with soft ear cushions, adjustable headbands, and lightweight design for extended wear during long study sessions.
                        </p>
                    </div>
                    
                    <div class="card-hover">
                        <h3 class="font-heading font-semibold text-lg mb-3">Sound Quality</h3>
                        <p class="text-gray-600 dark:text-gray-300">
                            Opt for clear, balanced audio that doesn't fatigue your ears. Avoid overly bass-heavy models that can be distracting during focused work.
                        </p>
                    </div>
                    
                    <div class="card-hover">
                        <h3 class="font-heading font-semibold text-lg mb-3">Battery Life</h3>
                        <p class="text-gray-600 dark:text-gray-300">
                            For wireless options, look for long battery life to avoid interruptions during extended study sessions. 20+ hours is ideal.
                        </p>
                    </div>
                </div>
            </div>

            <!-- FAQ Section -->
            <div class="mb-12">
                <h2 class="font-heading font-bold text-2xl sm:text-3xl mb-8 text-center">
                    Frequently Asked Questions
                </h2>
                
                <div class="space-y-6">
                    <div class="card-hover">
                        <h3 class="font-heading font-semibold text-lg mb-3">Do I need noise cancelling headphones for studying?</h3>
                        <p class="text-gray-600 dark:text-gray-300">
                            While not essential, noise cancelling headphones can significantly improve focus in noisy environments like libraries, coffee shops, or shared living spaces.
                        </p>
                    </div>
                    
                    <div class="card-hover">
                        <h3 class="font-heading font-semibold text-lg mb-3">Should I choose wired or wireless for studying?</h3>
                        <p class="text-gray-600 dark:text-gray-300">
                            Wireless headphones offer more freedom of movement, while wired options often provide better sound quality and don't require charging. Both work well for studying.
                        </p>
                    </div>
                    
                    <div class="card-hover">
                        <h3 class="font-heading font-semibold text-lg mb-3">How long should study headphones last?</h3>
                        <p class="text-gray-600 dark:text-gray-300">
                            Quality study headphones should last 3-5 years with proper care. Look for models with replaceable parts like ear cushions for extended lifespan.
                        </p>
                    </div>
                </div>
            </div>

            <!-- Related Articles -->
            <div class="mb-12">
                <h2 class="font-heading font-bold text-2xl sm:text-3xl mb-8 text-center">
                    Related Articles
                </h2>
                
                <div class="related-articles-grid">
                    <a href="/categories/best-noise-cancelling-headphones/" class="related-article-btn">
                        <h3>Best Noise Cancelling Headphones</h3>
                        <p>Block out distractions for maximum focus.</p>
                        <span class="btn-primary btn-sm" data-translate="btn_read_more">Read More</span>
                    </a>
                    
                    <a href="/categories/best-headphones-for-work/" class="related-article-btn">
                        <h3>Best Headphones for Work</h3>
                        <p>Professional options for office environments.</p>
                        <span class="btn-primary btn-sm" data-translate="btn_read_more">Read More</span>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-primary text-white py-12">
        <div class="content-container-wide">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                <div class="col-span-1 md:col-span-2">
                    <div class="flex items-center space-x-2 mb-4">
                        <img src="/public/favicon.svg?v=1.0.1" alt="MrHeadphones Logo" class="w-6 h-6 sm:w-7 sm:h-7 lg:w-8 lg:h-8 transition-all duration-300 group-hover:scale-105">
                        <span class="font-heading font-bold text-base sm:text-lg">MrHeadphones</span>
                    </div>
                    <p class="text-gray-300 mb-4">
                        MrHeadphones.com is a user-first headphone discovery platform that helps you find the right pair based on real-world testing, expert research, and audio performance for every need.
                    </p>
                </div>
                
                <div>
                    <h3 class="font-heading font-semibold text-lg mb-4" data-translate="footer_quick_links">Quick Links</h3>
                    <ul class="space-y-2">
                        <li><a href="/#home" class="text-gray-300 hover:text-white transition-colors">Home</a></li>
                        <li><a href="/#categories" class="text-gray-300 hover:text-white transition-colors">Categories</a></li>
                        <li><a href="/#devices" class="text-gray-300 hover:text-white transition-colors">Devices</a></li>
                        <li><a href="mailto:hello@mrheadphones.com" class="text-gray-300 hover:text-white transition-colors">Contact</a></li>
                    </ul>
                </div>
                
                <div>
                    <h3 class="font-heading font-semibold text-lg mb-4" data-translate="footer_connect">Connect</h3>
                    <ul class="space-y-2">
                        <li><a href="mailto:hello@mrheadphones.com" class="text-gray-300 hover:text-white transition-colors" data-translate="btn_email">Email</a></li>
                        <li><a href="#" class="text-gray-300 hover:text-white transition-colors" data-translate="btn_about">About</a></li>
                        <li><a href="/privacy.html" class="text-gray-300 hover:text-white transition-colors" data-translate="btn_privacy">Privacy</a></li>
                        <li><a href="/terms.html" class="text-gray-300 hover:text-white transition-colors" data-translate="btn_terms">Terms</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="border-t border-gray-700 mt-8 pt-8 text-center">
                <p class="text-gray-300">
                    © 2025 MrHeadphones.com. All rights reserved.
                </p>
            </div>
        </div>
    </footer>

    <!-- JavaScript -->
    <script src="/src/js/main.js"></script>
    <script src="/src/js/languages.js"></script>
</body>
</html>
EOF

    # Replace the end of the file with the complete structure
    # Find the line before the closing script tag and replace everything after it
    sed -i '/<script src="\/src\/js\/main.js"><\/script>/,/<\/body><\/html>/d' "$file"
    cat "${file}.temp" >> "$file"
    rm "${file}.temp"
    
    echo "✅ Added complete structure to: $file"
}

# Add complete structure to studying page
add_complete_structure \
    "categories/best-headphones-for-studying/index.html" \
    "Study Headphones" \
    "What to Look For in Study Headphones" \
    "study" \
    "study"

# Add complete structure to gaming page
add_complete_structure \
    "categories/best-headphones-for-gaming/index.html" \
    "Gaming Headphones" \
    "What to Look For in Gaming Headphones" \
    "gaming" \
    "gaming"

echo "🎉 Complete page structure added to all pages!" 