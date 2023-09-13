import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {

    const message = this.element.textContent.trim();
    const { icon } = this.element.dataset

    if( message ){
      const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 2000,
        timerProgressBar: true,
        didOpen: (toast) => {
          toast.addEventListener('mouseenter', Swal.stopTimer)
          toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
      });
  
      Toast.fire({
        icon: icon,
        title: message
      });
    }
  }
}
