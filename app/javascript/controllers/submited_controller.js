import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submited"
export default class extends Controller {

  static targets = ["disable"]

  connect() {
  }

  disable(e) {
    addEventListener("direct-upload:start", event => {
      this.disableTarget.disabled = true
      this.disableTarget.style.backgroundColor = "#c5c8c9"
    })
  }
}
