/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
    "./app/components/**/*.{rb,html.erb}",
  ],
  theme: {
    extend: {
      fontFamily: {
        'display': ['Nunito', 'Helvetica', 'sans-serif'],
        'body': ['Work Sans', 'Helvetica', 'sans-serif'],
        'neon': ['Indie Flower', 'cursive'],
      },
      colors: {
        'brand': {
          50: 'oklch(0.98 0.01 142.38)',
          100: 'oklch(0.95 0.02 142.38)',
          200: 'oklch(0.89 0.04 142.38)',
          300: 'oklch(0.82 0.06 142.38)',
          400: 'oklch(0.71 0.08 142.38)',
          500: 'oklch(0.59 0.10 142.38)',
          600: 'oklch(0.47 0.12 142.38)',
          700: 'oklch(0.37 0.14 142.38)',
          800: 'oklch(0.28 0.16 142.38)',
          900: 'oklch(0.21 0.18 142.38)',
          950: 'oklch(0.14 0.20 142.38)',
        }
      }
    },
  },
  plugins: [
    // Add any TailwindCSS plugins you need
  ],
}