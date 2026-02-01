import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["entries", "pagination", "loader", "image"]
  static offset = 300

  initialize() {
    this.scroll = this.throttle(this.scroll.bind(this), 500)
  }

  throttle(func, limit) {
    let inThrottle
    return function(...args) {
      if (!inThrottle) {
        func.apply(this, args)
        inThrottle = true
        setTimeout(() => inThrottle = false, limit)
      }
    }
  }

  scroll() {
    let url = this.paginationTarget.querySelector("a[rel='next']")?.href
    const body = document.body
    const html = document.documentElement
    const height = Math.max(
      body.scrollHeight,
      body.offsetHeight,
      html.clientHeight,
      html.scrollHeight,
      html.offsetHeight
    )

    if (
      window.pageYOffset >=
        height - (window.innerHeight + this.constructor.offset) &&
      url
    ) {
      this.loadNextData(url)
    }
  }

  async loadNextData(url) {
    this.loaderTarget.classList.remove("hidden")
    window.scrollTo({
      top: document.body.scrollHeight,
      behavior: "smooth"
    })

    try {
      const response = await fetch(url, {
        headers: { Accept: "application/json" }
      })
      const data = await response.json()

      this.entriesTarget.insertAdjacentHTML("beforeend", data.entries)
      this.paginationTarget.innerHTML = data.pagination
      this.loaderTarget.classList.add("hidden")

      const observer = new IntersectionObserver(
        (entries, observer) => {
          entries.forEach((entry) => {
            entry.target.src = entry.target.dataset.src
            observer.unobserve(entry.target)
          })
        },
        { rootMargin: "0px" }
      )
      this.imageTargets.forEach((target) => observer.observe(target))
      this.element.dispatchEvent(new Event("loaded"))
    } catch (error) {
      console.error("Error loading next page:", error)
      this.loaderTarget.classList.add("hidden")
    }
  }
}
