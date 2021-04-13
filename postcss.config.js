module.exports = {
  plugins: [
    require('tailwindcss')('./app/javascript/stylesheets/tailwind.config.js'),
    require('postcss-import'),
    require('postcss-nested'),
    require('autoprefixer')
  ]
}
