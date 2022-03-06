const plugin = require('tailwindcss/plugin');
const colors = require('tailwindcss/colors');

module.exports = {
  mode: 'jit',
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  darkMode: 'media', // or 'class'
  corePlugins: {
    preflight: true
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
    require('tailwindcss-important')
  ],
}
