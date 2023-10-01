window.dataLayer = window.dataLayer || []
function gtag() {
  dataLayer.push(arguments)
}
gtag('js', new Date())
document.addEventListener('turbolinks:load', (event) => {
  gtag('config', 'G-8YLBT9M560', {
    page_location: event.data.url,
    page_path: event.srcElement.location.pathName,
    page_title: event.srcElement.title,
  })
})

export default gtag
