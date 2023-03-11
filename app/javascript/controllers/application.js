import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application


export { application }
