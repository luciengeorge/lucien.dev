// Entry point for the build script in your package.json
import '@hotwired/turbo-rails'
require('@rails/ujs').start()
require('@rails/activestorage').start()
require('./channels')
require('trix')
require('@rails/actiontext')

import './controllers'
import AOS from 'aos'
import 'aos/dist/aos.css'
import '@animated-burgers/burger-rotate/dist/styles.css'
import gtag from './components/analytics'

window.Turbolinks = {
  visit: Turbo.visit,

  controller: {
    isDeprecatedAdapter(adapter) {
      return typeof adapter.visitProposedToLocation !== 'function'
    },

    startVisitToLocationWithAction(location, action, restorationIdentifier) {
      window.Turbo.navigator.startVisit(location, restorationIdentifier, {
        action,
      })
    },

    get restorationIdentifier() {
      return window.Turbo.navigator.restorationIdentifier
    },

    get adapter() {
      return window.Turbo.navigator.adapter
    },

    set adapter(adapter) {
      if (this.isDeprecatedAdapter(adapter)) {
        // Old mobile adapters do not support visitProposedToLocation()
        adapter.visitProposedToLocation = function (location, options) {
          adapter.visitProposedToLocationWithAction(location, options.action)
        }

        // Old mobile adapters use visit.location.absoluteURL, which is not available
        // because Turbo dropped the Location class in favor of the DOM URL API
        const adapterVisitStarted = adapter.visitStarted
        adapter.visitStarted = function (visit) {
          Object.defineProperties(visit.location, {
            absoluteURL: {
              configurable: true,
              get() {
                return this.toString()
              },
            },
          })

          adapter.currentVisit = visit
          adapterVisitStarted(visit)
        }
      }

      window.Turbo.registerAdapter(adapter)
    },
  },
}

document.addEventListener('turbo:load', () => {
  const event = new CustomEvent('turbolinks:load', {bubbles: true})
  document.documentElement.dispatchEvent(event)

  const vh = window.innerHeight * 0.01
  document.documentElement.style.setProperty('--vh', `${vh}px`)
  AOS.init()
})
