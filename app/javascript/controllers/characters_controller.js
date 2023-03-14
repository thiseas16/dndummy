import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="characters"
export default class extends Controller {
  static targets = [ "characterForm", "characterOutput" ]

  connect() {
    this.characterFormTarget.addEventListener("submit", this.handleSubmit.bind(this))
  }

  async handleSubmit(event) {
    event.preventDefault()

    const name = this.characterFormTarget.elements["name"].value
    const age = this.characterFormTarget.elements["age"].value
    const characterClass = this.characterFormTarget.elements["class"].value

    const response = await fetch("/characters", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        name,
        age,
        character_class: characterClass
      })
    })

    const data = await response.json()

    // Display the response on the page
    const output = `Name: ${data.name}, Age: ${data.age}, Class: ${data.character_class}`
    this.characterOutputTarget.innerHTML = output
  }

}
