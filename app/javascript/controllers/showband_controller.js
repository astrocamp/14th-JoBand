import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showband"
export default class extends Controller {

  static targets = ["band"];

  connect() {
  }

  show(e) {
    e.preventDefault();
    const displayStatus = this.bandTarget.style.display;
    if (displayStatus === "none") {
      this.bandTarget.style.display = "inline";
    } else {
      this.bandTarget.style.display = "none";
    }
  }
  
}
