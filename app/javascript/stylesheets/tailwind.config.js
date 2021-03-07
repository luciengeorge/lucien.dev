const plugin = require('tailwindcss/plugin');

module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  darkMode: false, // or 'media' or 'class'
  corePlugins: {
    preflight: true
  },
  theme: {
    extend: {},
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
    'active'
  ],
  plugins: [
    require('@tailwindcss/forms'),
    require('@neojp/tailwindcss-important-variant')
  ],
}
