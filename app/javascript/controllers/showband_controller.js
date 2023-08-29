import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showband"
export default class extends Controller {

  static targets = ["my_band"];

  connect() {
  }

  show(e) {
    e.preventDefault();
    const displayStatus = this.my_bandTarget.style.display;
    if (displayStatus === "none") {
      this.my_bandTarget.style.display = "inline";
    } else {
      this.my_bandTarget.style.display = "none";
    }
  }
  
}
