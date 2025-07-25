#!/bin/bash

echo "🔄 Restoring unique content to all pages..."

# Function to restore a page from its original backup
restore_page() {
    local page_dir="$1"
    local page_name="$2"
    
    echo "Restoring $page_name..."
    
    # Check if original backup exists
    if [ -f "$page_dir/index.html.backup" ]; then
        cp "$page_dir/index.html.backup" "$page_dir/index.html"
        echo "✅ Restored $page_name from original backup"
    else
        echo "⚠️  No original backup found for $page_name"
    fi
}

# Restore category pages
echo "Restoring category pages..."

# Bass Headphones
restore_page "categories/best-bass-headphones" "Best Bass Headphones"

# Bluetooth Headphones
restore_page "categories/best-bluetooth-headphones" "Best Bluetooth Headphones"

# Budget Gaming Headphones
restore_page "categories/best-budget-gaming-headphones" "Best Budget Gaming Headphones"

# Budget Headphones for Students
restore_page "categories/best-budget-headphones-for-students" "Best Budget Headphones for Students"

# Budget Wireless Headphones
restore_page "categories/best-budget-wireless-headphones" "Best Budget Wireless Headphones"

# Closed Back Headphones
restore_page "categories/best-closed-back-headphones" "Best Closed Back Headphones"

# Dynamic Driver Headphones
restore_page "categories/best-dynamic-driver-headphones" "Best Dynamic Driver Headphones"

# Electrostatic Headphones
restore_page "categories/best-electrostatic-headphones" "Best Electrostatic Headphones"

# Foldable Headphones
restore_page "categories/best-foldable-headphones" "Best Foldable Headphones"

# Foldable Headphones for Travel
restore_page "categories/best-foldable-headphones-for-travel" "Best Foldable Headphones for Travel"

# Gaming Headsets
restore_page "categories/best-gaming-headsets" "Best Gaming Headsets"

# Headphones for Airplane Travel
restore_page "categories/best-headphones-for-airplane-travel" "Best Headphones for Airplane Travel"

# Headphones for Android
restore_page "categories/best-headphones-for-android" "Best Headphones for Android"

# Headphones for Gaming
restore_page "categories/best-headphones-for-gaming" "Best Headphones for Gaming"

# Headphones for iPhone
restore_page "categories/best-headphones-for-iphone" "Best Headphones for iPhone"

# Headphones for Kids
restore_page "categories/best-headphones-for-kids" "Best Headphones for Kids"

# Headphones for Mac
restore_page "categories/best-headphones-for-mac" "Best Headphones for Mac"

# Headphones for MacBook
restore_page "categories/best-headphones-for-macbook" "Best Headphones for MacBook"

# Headphones for Music
restore_page "categories/best-headphones-for-music" "Best Headphones for Music"

# Headphones for PS5
restore_page "categories/best-headphones-for-ps5" "Best Headphones for PS5"

# Headphones for Running
restore_page "categories/best-headphones-for-running" "Best Headphones for Running"

# Headphones for Studying
restore_page "categories/best-headphones-for-studying" "Best Headphones for Studying"

# Headphones for Work
restore_page "categories/best-headphones-for-work" "Best Headphones for Work"

# Headphones for Work from Home
restore_page "categories/best-headphones-for-work-from-home" "Best Headphones for Work from Home"

# Headphones for Xbox
restore_page "categories/best-headphones-for-xbox" "Best Headphones for Xbox"

# Headphones Under 100
restore_page "categories/best-headphones-under-100" "Best Headphones Under 100"

# In-Ear Monitors
restore_page "categories/best-in-ear-monitors" "Best In-Ear Monitors"

# Noise Cancelling Headphones
restore_page "categories/best-noise-cancelling-headphones" "Best Noise Cancelling Headphones"

# Noise Cancelling Headphones for Travel
restore_page "categories/best-noise-cancelling-headphones-for-travel" "Best Noise Cancelling Headphones for Travel"

# Noise Cancelling Headphones Under 200
restore_page "categories/best-noise-cancelling-headphones-under-200" "Best Noise Cancelling Headphones Under 200"

# Office Headphones
restore_page "categories/best-office-headphones" "Best Office Headphones"

# On-Ear Headphones
restore_page "categories/best-on-ear-headphones" "Best On-Ear Headphones"

# Open Back Headphones
restore_page "categories/best-open-back-headphones" "Best Open Back Headphones"

# Over-Ear Headphones Under 100
restore_page "categories/best-over-ear-headphones-under-100" "Best Over-Ear Headphones Under 100"

# Planar Magnetic Headphones
restore_page "categories/best-planar-magnetic-headphones" "Best Planar Magnetic Headphones"

# Studio Headphones
restore_page "categories/best-studio-headphones" "Best Studio Headphones"

# Travel Headphones
restore_page "categories/best-travel-headphones" "Best Travel Headphones"

# Waterproof Headphones
restore_page "categories/best-waterproof-headphones" "Best Waterproof Headphones"

# Wireless Earbuds
restore_page "categories/best-wireless-earbuds" "Best Wireless Earbuds"

# Wireless Headphones
restore_page "categories/best-wireless-headphones" "Best Wireless Headphones"

# Workout Headphones
restore_page "categories/best-workout-headphones" "Best Workout Headphones"

echo "✅ All pages restored to their unique content!" 