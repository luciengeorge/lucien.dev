// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Note: This file is deprecated in favor of app/javascript/application.js for Rails 7+
import "@hotwired/turbo-rails"
require('channels')
require('trix')
require('@rails/actiontext')

import 'controllers'
import AOS from 'aos'
import 'stylesheets/tailwind/before.scss'
import 'stylesheets/application.scss'
import 'stylesheets/tailwind/after.scss'
import 'aos/dist/aos.css'
import '@animated-burgers/burger-rotate/dist/styles.css'
import gtag from './components/analytics'

document.addEventListener('turbo:load', () => {
  const vh = window.innerHeight * 0.01
  document.documentElement.style.setProperty('--vh', `${vh}px`)
  AOS.init()
})
