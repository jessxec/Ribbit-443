/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        // Ribbit brand colors from the app
        'ribbit-dark': '#2B5B81',
        'ribbit-off-white': '#F5F0EA',
        'ribbit-light-teal': '#B6E8DF',
        'ribbit-dark-teal': '#50B2B7',
        'ribbit-pale-green': '#C5DF76',
        'ribbit-background': '#FFFAF3',
        'ribbit-pale-teal': '#B6E8DF',
        'ribbit-pale-yellow': '#F5F0EA',
      },
      fontFamily: {
        'ribbit': ['-apple-system', 'BlinkMacSystemFont', 'SF Pro Display', 'system-ui', 'sans-serif'],
      },
      backgroundImage: {
        'ribbit-gradient': 'linear-gradient(135deg, #FFFAF3 0%, #F5F0EA 100%)',
        'hero-gradient': 'linear-gradient(135deg, #2B5B81 0%, #50B2B7 100%)',
      },
      animation: {
        'float': 'float 3s ease-in-out infinite',
        'bounce-slow': 'bounce 2s infinite',
      },
      keyframes: {
        float: {
          '0%, 100%': { transform: 'translateY(0px)' },
          '50%': { transform: 'translateY(-10px)' },
        }
      }
    },
  },
  plugins: [],
}
