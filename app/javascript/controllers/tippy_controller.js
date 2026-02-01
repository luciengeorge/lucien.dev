import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    content: String
  }

  connect() {
    if (typeof tippy !== 'undefined') {
      tippy(this.element, {
        content: this.contentValue,
        animation: "scale-extreme",
        inertia: true,
        theme: "light"
      })
    }
  }
}
