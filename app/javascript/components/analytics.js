window.dataLayer = window.dataLayer || []
function gtag() {
  dataLayer.push(arguments)
}
gtag('js', new Date())

// Updated for Turbo instead of Turbolinks
document.addEventListener('turbo:visit', (event) => {
  gtag('config', 'G-8YLBT9M560', {
    page_location: window.location.href,
    page_path: window.location.pathname,
    page_title: document.title,
  })
})

export default gtag