module.exports = {
  plugins: [
    require('postcss-import'),
    require('tailwindcss/nesting'),
    require('tailwindcss')('./config/tailwind.config.js'),
    require('autoprefixer'),
    require('postcss-nested'),
  ],
}
