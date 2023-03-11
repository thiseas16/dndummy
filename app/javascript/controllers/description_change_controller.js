import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="description-change"
export default class extends Controller {
  static targets = ["descriptionlist", "spellsb"]
  connect() {
    console.log('i am bro')
  }

  change(event) {
    const description = event.target.getAttribute('data-information')
    this.descriptionlistTarget.innerHTML = description
    }

  unchange() {
    // this.descriptionlistTarget.innerHTML = "info"
  }
}
