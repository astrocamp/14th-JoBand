import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="switch"
export default class extends Controller {

  static targets = ["mode_switch"];

  connect() {
    this.assignCurrentMode()
  }

  switch_mode() {
    let mode = this.element.dataset.theme
    let theme_now = localStorage.getItem('color-theme')

    if (theme_now){
      if (theme_now == "light") {
        this.set_dark_mode()
      }
      else{
        this.set_light_mode()
      }
    }
    else{
      if (mode == "light") {
        this.set_dark_mode()
      }
      else{
        this.set_light_mode()
      }
    }
  }

  set_light_mode(){
    this.element.dataset.theme = "light"
    this.mode_switchTarget.src = "/icon_img/light.svg"
    localStorage.setItem('color-theme', 'light')
  }

  set_dark_mode(){
    this.element.dataset.theme = "dark"
    this.mode_switchTarget.src = "/icon_img/dark.svg"
    localStorage.setItem('color-theme', 'dark')
  }

  assignCurrentMode() {
    let theme_now = localStorage.getItem('color-theme')
    if(theme_now == "light"){
      this.set_light_mode()
    }
    else{
      this.set_dark_mode()
    }
  }
}
