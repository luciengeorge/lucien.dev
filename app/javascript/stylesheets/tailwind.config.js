const plugin = require('tailwindcss/plugin');

module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  corePlugins: {
    preflight: true
  },
  theme: {
    extend: {},
  },
  variants: {
    extend: {
      margin: ['important'],
      fontWeight: ['important'],
      borderRadius: ['important']
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    plugin(function({ addVariant }) {
      addVariant('important', ({ container }) => {
        container.walkRules(rule => {
          rule.selector = `.\\!${rule.selector.slice(1)}`
          rule.walkDecls(decl => {
            decl.important = true
          })
        })
      })
    })
  ],
}
