import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

document.addEventListener("turbo:load", () => {
  const vh = window.innerHeight * 0.01
  document.documentElement.style.setProperty("--vh", `${vh}px`)

  // AOS init if available globally (loaded via script tag)
  if (typeof AOS !== 'undefined') {
    AOS.init()
  }
})

// Google Analytics
window.dataLayer = window.dataLayer || []
function gtag() {
  dataLayer.push(arguments)
}
gtag("js", new Date())
document.addEventListener("turbo:load", () => {
  gtag("config", "G-8YLBT9M560", {
    page_location: window.location.href,
    page_path: window.location.pathname,
    page_title: document.title
  })
})
