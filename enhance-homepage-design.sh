#!/bin/bash

echo "🎨 Enhancing homepage design with beautiful Tailwind CSS styling..."

# Function to enhance the homepage design
enhance_homepage() {
    local file="$1"
    echo "Processing: $file"
    
    # Create backup
    cp "$file" "$file.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Step 1: Enhance Categories Section with better styling
    echo "Enhancing Categories Section..."
    
    # Replace the categories section with enhanced design
    sed -i '/<!-- Categories Section -->/,/<\/section>/c\
    <!-- Categories Section -->\
    <section id="categories" class="py-20 bg-gradient-to-br from-gray-50 via-white to-gray-50 dark:from-gray-800 dark:via-gray-900 dark:to-gray-800 relative overflow-hidden">\
        <!-- Background Pattern -->\
        <div class="absolute inset-0 bg-pattern opacity-5"></div>\
        <div class="content-container relative z-10">\
            <div class="text-center mb-16">\
                <div class="inline-flex items-center justify-center w-16 h-16 bg-secondary/10 rounded-full mb-6">\
                    <svg class="w-8 h-8 text-secondary" fill="none" stroke="currentColor" viewBox="0 0 24 24">\
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>\
                    </svg>\
                </div>\
                <h2 class="font-heading font-bold text-3xl sm:text-4xl lg:text-5xl mb-6 bg-gradient-to-r from-gray-900 to-gray-600 dark:from-white dark:to-gray-300 bg-clip-text text-transparent">\
                    Browse by Category\
                </h2>\
                <p class="text-lg text-gray-600 dark:text-gray-300 max-w-3xl mx-auto leading-relaxed">\
                    Find headphones tailored to your specific needs and preferences.\
                </p>\
            </div>\
            \
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 lg:gap-8">\
                <a href="/categories/best-wireless-headphones/" class="group relative overflow-hidden bg-white dark:bg-gray-800 rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 border border-gray-100 dark:border-gray-700 p-6">\
                    <div class="absolute inset-0 bg-gradient-to-br from-secondary/5 to-accent/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>\
                    <div class="relative z-10">\
                        <div class="mb-6 flex justify-center">\
                            <div class="w-16 h-16 bg-gradient-to-br from-secondary to-accent rounded-2xl flex items-center justify-center shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110">\
                                <img src="/public/favicon.svg" alt="Wireless Headphones" class="w-8 h-8 sm:w-10 sm:h-10 lg:w-12 lg:h-12 text-white filter brightness-0 invert">\
                            </div>\
                        </div>\
                        <h3 class="font-heading font-bold text-xl mb-3 text-gray-900 dark:text-white group-hover:text-secondary transition-colors duration-300">Wireless</h3>\
                        <p class="text-gray-600 dark:text-gray-300 text-sm leading-relaxed">Freedom from cables with premium wireless technology</p>\
                        <div class="mt-4 flex items-center text-secondary opacity-0 group-hover:opacity-100 transition-all duration-300">\
                            <span class="text-sm font-semibold">Explore</span>\
                            <svg class="w-4 h-4 ml-2 transform group-hover:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">\
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>\
                            </svg>\
                        </div>\
                    </div>\
                </a>\
                \
                <a href="/categories/best-gaming-headsets/" class="group relative overflow-hidden bg-white dark:bg-gray-800 rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 border border-gray-100 dark:border-gray-700 p-6">\
                    <div class="absolute inset-0 bg-gradient-to-br from-secondary/5 to-accent/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>\
                    <div class="relative z-10">\
                        <div class="mb-6 flex justify-center">\
                            <div class="w-16 h-16 bg-gradient-to-br from-purple-500 to-pink-500 rounded-2xl flex items-center justify-center shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110">\
                                <img src="/public/favicon.svg" alt="Gaming Headsets" class="w-8 h-8 sm:w-10 sm:h-10 lg:w-12 lg:h-12 text-white filter brightness-0 invert">\
                            </div>\
                        </div>\
                        <h3 class="font-heading font-bold text-xl mb-3 text-gray-900 dark:text-white group-hover:text-purple-600 transition-colors duration-300">Gaming</h3>\
                        <p class="text-gray-600 dark:text-gray-300 text-sm leading-relaxed">Immersive audio experience for competitive gaming</p>\
                        <div class="mt-4 flex items-center text-purple-600 opacity-0 group-hover:opacity-100 transition-all duration-300">\
                            <span class="text-sm font-semibold">Explore</span>\
                            <svg class="w-4 h-4 ml-2 transform group-hover:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">\
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>\
                            </svg>\
                        </div>\
                    </div>\
                </a>\
                \
                <a href="/categories/best-noise-cancelling-headphones/" class="group relative overflow-hidden bg-white dark:bg-gray-800 rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 border border-gray-100 dark:border-gray-700 p-6">\
                    <div class="absolute inset-0 bg-gradient-to-br from-secondary/5 to-accent/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>\
                    <div class="relative z-10">\
                        <div class="mb-6 flex justify-center">\
                            <div class="w-16 h-16 bg-gradient-to-br from-blue-500 to-cyan-500 rounded-2xl flex items-center justify-center shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110">\
                                <img src="/public/favicon.svg" alt="Noise Cancelling" class="w-8 h-8 sm:w-10 sm:h-10 lg:w-12 lg:h-12 text-white filter brightness-0 invert">\
                            </div>\
                        </div>\
                        <h3 class="font-heading font-bold text-xl mb-3 text-gray-900 dark:text-white group-hover:text-blue-600 transition-colors duration-300">Noise Cancelling</h3>\
                        <p class="text-gray-600 dark:text-gray-300 text-sm leading-relaxed">Block out distractions with advanced ANC technology</p>\
                        <div class="mt-4 flex items-center text-blue-600 opacity-0 group-hover:opacity-100 transition-all duration-300">\
                            <span class="text-sm font-semibold">Explore</span>\
                            <svg class="w-4 h-4 ml-2 transform group-hover:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">\
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>\
                            </svg>\
                        </div>\
                    </div>\
                </a>\
                \
                <a href="/categories/best-studio-headphones/" class="group relative overflow-hidden bg-white dark:bg-gray-800 rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 border border-gray-100 dark:border-gray-700 p-6">\
                    <div class="absolute inset-0 bg-gradient-to-br from-secondary/5 to-accent/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>\
                    <div class="relative z-10">\
                        <div class="mb-6 flex justify-center">\
                            <div class="w-16 h-16 bg-gradient-to-br from-orange-500 to-red-500 rounded-2xl flex items-center justify-center shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110">\
                                <img src="/public/favicon.svg" alt="Studio Headphones" class="w-8 h-8 sm:w-10 sm:h-10 lg:w-12 lg:h-12 text-white filter brightness-0 invert">\
                            </div>\
                        </div>\
                        <h3 class="font-heading font-bold text-xl mb-3 text-gray-900 dark:text-white group-hover:text-orange-600 transition-colors duration-300">Studio</h3>\
                        <p class="text-gray-600 dark:text-gray-300 text-sm leading-relaxed">Professional audio quality for studio production</p>\
                        <div class="mt-4 flex items-center text-orange-600 opacity-0 group-hover:opacity-100 transition-all duration-300">\
                            <span class="text-sm font-semibold">Explore</span>\
                            <svg class="w-4 h-4 ml-2 transform group-hover:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">\
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>\
                            </svg>\
                        </div>\
                    </div>\
                </a>\
                \
                <a href="/categories/best-headphones-for-work/" class="group relative overflow-hidden bg-white dark:bg-gray-800 rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 border border-gray-100 dark:border-gray-700 p-6">\
                    <div class="absolute inset-0 bg-gradient-to-br from-secondary/5 to-accent/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>\
                    <div class="relative z-10">\
                        <div class="mb-6 flex justify-center">\
                            <div class="w-16 h-16 bg-gradient-to-br from-green-500 to-emerald-500 rounded-2xl flex items-center justify-center shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110">\
                                <img src="/public/favicon.svg" alt="Work Headphones" class="w-8 h-8 sm:w-10 sm:h-10 lg:w-12 lg:h-12 text-white filter brightness-0 invert">\
                            </div>\
                        </div>\
                        <h3 class="font-heading font-bold text-xl mb-3 text-gray-900 dark:text-white group-hover:text-green-600 transition-colors duration-300">Work</h3>\
                        <p class="text-gray-600 dark:text-gray-300 text-sm leading-relaxed">Productivity focused with comfort for long hours</p>\
                        <div class="mt-4 flex items-center text-green-600 opacity-0 group-hover:opacity-100 transition-all duration-300">\
                            <span class="text-sm font-semibold">Explore</span>\
                            <svg class="w-4 h-4 ml-2 transform group-hover:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">\
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>\
                            </svg>\
                        </div>\
                    </div>\
                </a>\
                \
                <a href="/categories/best-travel-headphones/" class="group relative overflow-hidden bg-white dark:bg-gray-800 rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 border border-gray-100 dark:border-gray-700 p-6">\
                    <div class="absolute inset-0 bg-gradient-to-br from-secondary/5 to-accent/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>\
                    <div class="relative z-10">\
                        <div class="mb-6 flex justify-center">\
                            <div class="w-16 h-16 bg-gradient-to-br from-indigo-500 to-purple-500 rounded-2xl flex items-center justify-center shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110">\
                                <img src="/public/favicon.svg" alt="Travel Headphones" class="w-8 h-8 sm:w-10 sm:h-10 lg:w-12 lg:h-12 text-white filter brightness-0 invert">\
                            </div>\
                        </div>\
                        <h3 class="font-heading font-bold text-xl mb-3 text-gray-900 dark:text-white group-hover:text-indigo-600 transition-colors duration-300">Travel</h3>\
                        <p class="text-gray-600 dark:text-gray-300 text-sm leading-relaxed">Portable and durable for your adventures</p>\
                        <div class="mt-4 flex items-center text-indigo-600 opacity-0 group-hover:opacity-100 transition-all duration-300">\
                            <span class="text-sm font-semibold">Explore</span>\
                            <svg class="w-4 h-4 ml-2 transform group-hover:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">\
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>\
                            </svg>\
                        </div>\
                    </div>\
                </a>\
                \
                <a href="/categories/best-headphones-under-100/" class="group relative overflow-hidden bg-white dark:bg-gray-800 rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 border border-gray-100 dark:border-gray-700 p-6">\
                    <div class="absolute inset-0 bg-gradient-to-br from-secondary/5 to-accent/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>\
                    <div class="relative z-10">\
                        <div class="mb-6 flex justify-center">\
                            <div class="w-16 h-16 bg-gradient-to-br from-yellow-500 to-orange-500 rounded-2xl flex items-center justify-center shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110">\
                                <img src="/public/favicon.svg" alt="Budget Headphones" class="w-8 h-8 sm:w-10 sm:h-10 lg:w-12 lg:h-12 text-white filter brightness-0 invert">\
                            </div>\
                        </div>\
                        <h3 class="font-heading font-bold text-xl mb-3 text-gray-900 dark:text-white group-hover:text-yellow-600 transition-colors duration-300">Budget</h3>\
                        <p class="text-gray-600 dark:text-gray-300 text-sm leading-relaxed">Great value options without compromising quality</p>\
                        <div class="mt-4 flex items-center text-yellow-600 opacity-0 group-hover:opacity-100 transition-all duration-300">\
                            <span class="text-sm font-semibold">Explore</span>\
                            <svg class="w-4 h-4 ml-2 transform group-hover:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">\
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>\
                            </svg>\
                        </div>\
                    </div>\
                </a>\
                \
                <a href="/categories/best-headphones-for-kids/" class="group relative overflow-hidden bg-white dark:bg-gray-800 rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-2 border border-gray-100 dark:border-gray-700 p-6">\
                    <div class="absolute inset-0 bg-gradient-to-br from-secondary/5 to-accent/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>\
                    <div class="relative z-10">\
                        <div class="mb-6 flex justify-center">\
                            <div class="w-16 h-16 bg-gradient-to-br from-pink-500 to-rose-500 rounded-2xl flex items-center justify-center shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110">\
                                <img src="/public/favicon.svg" alt="Kids Headphones" class="w-8 h-8 sm:w-10 sm:h-10 lg:w-12 lg:h-12 text-white filter brightness-0 invert">\
                            </div>\
                        </div>\
                        <h3 class="font-heading font-bold text-xl mb-3 text-gray-900 dark:text-white group-hover:text-pink-600 transition-colors duration-300">Kids</h3>\
                        <p class="text-gray-600 dark:text-gray-300 text-sm leading-relaxed">Safe and durable for young listeners</p>\
                        <div class="mt-4 flex items-center text-pink-600 opacity-0 group-hover:opacity-100 transition-all duration-300">\
                            <span class="text-sm font-semibold">Explore</span>\
                            <svg class="w-4 h-4 ml-2 transform group-hover:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">\
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>\
                            </svg>\
                        </div>\
                    </div>\
                </a>\
            </div>\
        </div>\
    </section>' "$file"
    
    # Step 2: Enhance Device Integration Section
    echo "Enhancing Device Integration Section..."
    
    # Replace the device integration section with enhanced design
    sed -i '/<!-- Device Integration Section -->/,/<\/section>/c\
    <!-- Device Integration Section -->\
    <section id="devices" class="py-20 bg-gradient-to-br from-white via-gray-50 to-white dark:from-gray-900 dark:via-gray-800 dark:to-gray-900 relative overflow-hidden">\
        <!-- Background Pattern -->\
        <div class="absolute inset-0 bg-pattern opacity-5"></div>\
        <div class="content-container relative z-10">\
            <div class="text-center mb-16">\
                <div class="inline-flex items-center justify-center w-16 h-16 bg-secondary/10 rounded-full mb-6">\
                    <svg class="w-8 h-8 text-secondary" fill="none" stroke="currentColor" viewBox="0 0 24 24">\
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>\
                    </svg>\
                </div>\
                <h2 class="font-heading font-bold text-3xl sm:text-4xl lg:text-5xl mb-6 bg-gradient-to-r from-gray-900 to-gray-600 dark:from-white dark:to-gray-300 bg-clip-text text-transparent">\
                    Device Integration\
                </h2>\
                <p class="text-lg text-gray-600 dark:text-gray-300 max-w-3xl mx-auto leading-relaxed">\
                    Find headphones that work seamlessly with your favorite devices and platforms.\
                </p>\
            </div>\
            \
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 lg:gap-10">\
                <!-- iPhone Integration -->\
                <div class="group relative overflow-hidden bg-white dark:bg-gray-800 rounded-3xl shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-3 border border-gray-100 dark:border-gray-700 p-8">\
                    <div class="absolute inset-0 bg-gradient-to-br from-blue-500/5 to-purple-500/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>\
                    <div class="relative z-10">\
                        <div class="text-center mb-6">\
                            <div class="inline-flex items-center justify-center w-20 h-20 bg-gradient-to-br from-blue-500 to-purple-600 rounded-3xl shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110 mb-6">\
                                <img src="/public/favicon.svg" alt="iPhone" class="w-10 h-10 sm:w-12 sm:h-12 lg:w-14 lg:h-14 text-white filter brightness-0 invert">\
                            </div>\
                            <h3 class="font-heading font-bold text-2xl mb-3 text-gray-900 dark:text-white group-hover:text-blue-600 transition-colors duration-300">iPhone</h3>\
                            <p class="text-gray-600 dark:text-gray-300 mb-6 leading-relaxed">Perfect compatibility with iOS devices</p>\
                        </div>\
                        <div class="space-y-4 mb-8">\
                            <div class="flex items-center space-x-3 p-3 bg-green-50 dark:bg-green-900/20 rounded-xl">\
                                <div class="flex-shrink-0 w-6 h-6 bg-green-500 rounded-full flex items-center justify-center">\
                                    <svg class="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">\
                                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>\
                                    </svg>\
                                </div>\
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-200">Lightning connector support</span>\
                            </div>\
                            <div class="flex items-center space-x-3 p-3 bg-green-50 dark:bg-green-900/20 rounded-xl">\
                                <div class="flex-shrink-0 w-6 h-6 bg-green-500 rounded-full flex items-center justify-center">\
                                    <svg class="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">\
                                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>\
                                    </svg>\
                                </div>\
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-200">Siri integration</span>\
                            </div>\
                            <div class="flex items-center space-x-3 p-3 bg-green-50 dark:bg-green-900/20 rounded-xl">\
                                <div class="flex-shrink-0 w-6 h-6 bg-green-500 rounded-full flex items-center justify-center">\
                                    <svg class="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">\
                                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>\
                                    </svg>\
                                </div>\
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-200">AirPods alternatives</span>\
                            </div>\
                        </div>\
                        <div class="flex flex-col sm:flex-row gap-3">\
                            <a href="/categories/best-headphones-for-iphone/" class="flex-1 bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 text-white font-semibold text-sm sm:text-base px-6 py-3 rounded-xl transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 text-center">\
                                View iPhone Options\
                            </a>\
                            <a href="/categories/best-wireless-earbuds/" class="flex-1 border-2 border-blue-500 text-blue-600 hover:bg-blue-500 hover:text-white font-semibold text-sm sm:text-base px-6 py-3 rounded-xl transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 text-center">\
                                Wireless Earbuds\
                            </a>\
                        </div>\
                    </div>\
                </div>\
                \
                <!-- Android Integration -->\
                <div class="group relative overflow-hidden bg-white dark:bg-gray-800 rounded-3xl shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-3 border border-gray-100 dark:border-gray-700 p-8">\
                    <div class="absolute inset-0 bg-gradient-to-br from-green-500/5 to-teal-500/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>\
                    <div class="relative z-10">\
                        <div class="text-center mb-6">\
                            <div class="inline-flex items-center justify-center w-20 h-20 bg-gradient-to-br from-green-500 to-teal-600 rounded-3xl shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110 mb-6">\
                                <img src="/public/favicon.svg" alt="Android" class="w-10 h-10 sm:w-12 sm:h-12 lg:w-14 lg:h-14 text-white filter brightness-0 invert">\
                            </div>\
                            <h3 class="font-heading font-bold text-2xl mb-3 text-gray-900 dark:text-white group-hover:text-green-600 transition-colors duration-300">Android</h3>\
                            <p class="text-gray-600 dark:text-gray-300 mb-6 leading-relaxed">Optimized for Android ecosystem</p>\
                        </div>\
                        <div class="space-y-4 mb-8">\
                            <div class="flex items-center space-x-3 p-3 bg-green-50 dark:bg-green-900/20 rounded-xl">\
                                <div class="flex-shrink-0 w-6 h-6 bg-green-500 rounded-full flex items-center justify-center">\
                                    <svg class="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">\
                                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>\
                                    </svg>\
                                </div>\
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-200">USB-C connectivity</span>\
                            </div>\
                            <div class="flex items-center space-x-3 p-3 bg-green-50 dark:bg-green-900/20 rounded-xl">\
                                <div class="flex-shrink-0 w-6 h-6 bg-green-500 rounded-full flex items-center justify-center">\
                                    <svg class="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">\
                                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>\
                                    </svg>\
                                </div>\
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-200">Google Assistant</span>\
                            </div>\
                            <div class="flex items-center space-x-3 p-3 bg-green-50 dark:bg-green-900/20 rounded-xl">\
                                <div class="flex-shrink-0 w-6 h-6 bg-green-500 rounded-full flex items-center justify-center">\
                                    <svg class="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">\
                                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>\
                                    </svg>\
                                </div>\
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-200">High-res audio support</span>\
                            </div>\
                        </div>\
                        <div class="flex flex-col sm:flex-row gap-3">\
                            <a href="/categories/best-headphones-for-android/" class="flex-1 bg-gradient-to-r from-green-500 to-teal-600 hover:from-green-600 hover:to-teal-700 text-white font-semibold text-sm sm:text-base px-6 py-3 rounded-xl transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 text-center">\
                                View Android Options\
                            </a>\
                            <a href="/categories/best-bluetooth-headphones/" class="flex-1 border-2 border-green-500 text-green-600 hover:bg-green-500 hover:text-white font-semibold text-sm sm:text-base px-6 py-3 rounded-xl transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 text-center">\
                                Bluetooth Options\
                            </a>\
                        </div>\
                    </div>\
                </div>\
                \
                <!-- Gaming Consoles -->\
                <div class="group relative overflow-hidden bg-white dark:bg-gray-800 rounded-3xl shadow-xl hover:shadow-2xl transition-all duration-500 transform hover:-translate-y-3 border border-gray-100 dark:border-gray-700 p-8">\
                    <div class="absolute inset-0 bg-gradient-to-br from-purple-500/5 to-pink-500/5 opacity-0 group-hover:opacity-100 transition-opacity duration-500"></div>\
                    <div class="relative z-10">\
                        <div class="text-center mb-6">\
                            <div class="inline-flex items-center justify-center w-20 h-20 bg-gradient-to-br from-purple-500 to-pink-600 rounded-3xl shadow-lg group-hover:shadow-xl transition-all duration-500 transform group-hover:scale-110 mb-6">\
                                <img src="/public/favicon.svg" alt="Gaming" class="w-10 h-10 sm:w-12 sm:h-12 lg:w-14 lg:h-14 text-white filter brightness-0 invert">\
                            </div>\
                            <h3 class="font-heading font-bold text-2xl mb-3 text-gray-900 dark:text-white group-hover:text-purple-600 transition-colors duration-300">Gaming</h3>\
                            <p class="text-gray-600 dark:text-gray-300 mb-6 leading-relaxed">Immersive gaming audio experience</p>\
                        </div>\
                        <div class="space-y-4 mb-8">\
                            <div class="flex items-center space-x-3 p-3 bg-green-50 dark:bg-green-900/20 rounded-xl">\
                                <div class="flex-shrink-0 w-6 h-6 bg-green-500 rounded-full flex items-center justify-center">\
                                    <svg class="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">\
                                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>\
                                    </svg>\
                                </div>\
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-200">3D spatial audio</span>\
                            </div>\
                            <div class="flex items-center space-x-3 p-3 bg-green-50 dark:bg-green-900/20 rounded-xl">\
                                <div class="flex-shrink-0 w-6 h-6 bg-green-500 rounded-full flex items-center justify-center">\
                                    <svg class="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">\
                                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>\
                                    </svg>\
                                </div>\
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-200">Low latency</span>\
                            </div>\
                            <div class="flex items-center space-x-3 p-3 bg-green-50 dark:bg-green-900/20 rounded-xl">\
                                <div class="flex-shrink-0 w-6 h-6 bg-green-500 rounded-full flex items-center justify-center">\
                                    <svg class="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">\
                                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>\
                                    </svg>\
                                </div>\
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-200">Cross-platform support</span>\
                            </div>\
                        </div>\
                        <div class="flex flex-col sm:flex-row gap-3">\
                            <a href="/categories/best-gaming-headsets/" class="flex-1 bg-gradient-to-r from-purple-500 to-pink-600 hover:from-purple-600 hover:to-pink-700 text-white font-semibold text-sm sm:text-base px-6 py-3 rounded-xl transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2 text-center">\
                                Gaming Headsets\
                            </a>\
                            <a href="/categories/best-headphones-for-ps5/" class="flex-1 border-2 border-purple-500 text-purple-600 hover:bg-purple-500 hover:text-white font-semibold text-sm sm:text-base px-6 py-3 rounded-xl transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2 text-center">\
                                PS5 Options\
                            </a>\
                        </div>\
                    </div>\
                </div>\
            </div>\
        </div>\
    </section>' "$file"
}

# Enhance the homepage
echo "Enhancing homepage design..."
enhance_homepage "index.html"

echo "✅ Homepage design enhanced with beautiful Tailwind CSS styling!" 