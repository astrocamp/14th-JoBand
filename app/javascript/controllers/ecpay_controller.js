import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="ecpay"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.submit();
    });
  }
}
