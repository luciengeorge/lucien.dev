import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]
  static values = {
    apiKey: String
  }

  connect() {
    if (this.hasApiKeyValue && this.apiKeyValue) {
      this.initGooglePlaces()
    }
  }

  async initGooglePlaces() {
    if (window.google?.maps?.places) {
      this.setupAutocomplete()
      return
    }

    const script = document.createElement("script")
    script.src = `https://maps.googleapis.com/maps/api/js?key=${this.apiKeyValue}&libraries=places`
    script.async = true
    script.onload = () => this.setupAutocomplete()
    document.head.appendChild(script)
  }

  setupAutocomplete() {
    if (!this.hasInputTarget) return

    const autocomplete = new google.maps.places.Autocomplete(this.inputTarget, {
      types: ["(cities)"]
    })

    autocomplete.addListener("place_changed", () => {
      const place = autocomplete.getPlace()
      if (place.formatted_address) {
        this.inputTarget.value = place.formatted_address
      }
    })
  }
}
