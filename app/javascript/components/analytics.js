window.dataLayer = window.dataLayer || []
function gtag() {
  dataLayer.push(arguments)
}
gtag('js', new Date())
document.addEventListener('turbo:load', (event) => {
  gtag('config', 'G-8YLBT9M560', {
    page_location: event.detail.url,
    page_path: window.location.pathName,
    page_title: window.document.title,
  })
})

export default gtag
