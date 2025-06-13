import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    this.hide()
  }

  toggle() {
    if (this.formTarget.classList.contains("hidden")) {
      this.show()
    } else {
      this.hide()
    }
  }

  show() {
    this.formTarget.classList.remove("hidden")
  }

  hide() {
    this.formTarget.classList.add("hidden")
  }
} 