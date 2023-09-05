import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch"
export default class extends Controller {

  static targets = ["mode_switch"];

  connect() {
  }

  switch_mode() {

    let mode = this.element.dataset.theme 
    let mode_img = this.mode_switchTarget.src

    console.log(mode_img);

    if (mode == "light") {
      this.element.dataset.theme = "dark"
      this.mode_switchTarget.src = "/icon_img/dark.svg"
    }
    else{
      this.element.dataset.theme = "light"
      this.mode_switchTarget.src = "/icon_img/light.svg"
    }
  }
}
