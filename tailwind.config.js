/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,js}",
    "./*.html"
  ],
  theme: {
    extend: {
      colors: {
        primary: '#1F2937', // Deep Graphite
        secondary: '#4F46E5', // Electric Blue
        accent: '#D97706', // Amber Orange
        background: {
          light: '#FFFFFF',
          dark: '#0F172A'
        },
        text: {
          light: '#1F2937',
          dark: '#E2E8F0'
        }
      },
      fontFamily: {
        'heading': ['IBM Plex Sans', 'sans-serif'],
        'body': ['Inter', 'sans-serif']
      },
      backgroundImage: {
        'hero-gradient': 'linear-gradient(135deg, #4F46E5 0%, #1E1B4B 100%)'
      }
    },
  },
  plugins: [],
  darkMode: 'class'
} 