const plugin = require('tailwindcss/plugin')
const colors = require('tailwindcss/colors')

module.exports = {
  mode: 'jit',
  purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  corePlugins: {
    preflight: true,
  },
  variants: [
    'responsive',
    'hover',
    'focus',
    'active',
    'important',
    'first',
    'last',
    'odd',
    'even',
    'visited',
    'checked',
    'group-hover',
    'group-focus',
    'focus-within',
    'hover',
    'focus',
    'focus-visible',
    'active',
  ],
  plugins: [require('@tailwindcss/forms'), require('tailwindcss-important')],
}
