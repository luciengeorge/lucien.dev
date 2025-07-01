// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import AOS from 'aos'
import 'aos/dist/aos.css'
import '@animated-burgers/burger-rotate/dist/styles.css'
import gtag from './components/analytics'

// Initialize AOS (Animate On Scroll)
document.addEventListener('turbo:load', () => {
  const vh = window.innerHeight * 0.01
  document.documentElement.style.setProperty('--vh', `${vh}px`)
  AOS.init()
})

// Export for global access if needed
window.gtag = gtag