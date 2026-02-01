import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "overlay", "wrapper"]

  toggle(event) {
    event.preventDefault()
    this.wrapperTarget.classList.toggle("hidden")
  }

  closeWithKeyboard(event) {
    if (
      !this.hasWrapperTarget ||
      !this.hasModalTarget ||
      !this.hasOverlayTarget
    )
      return
    if (this.wrapperTarget.classList.contains("hidden") || event.keyCode !== 27)
      return
    this.wrapperTarget.classList.add("hidden")
  }
}
