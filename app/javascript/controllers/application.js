import { Application } from "@hotwired/stimulus"
import TextareaAutogrow from "stimulus-textarea-autogrow"

const application = Application.start()
application.register("textarea-autogrow", TextareaAutogrow)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
