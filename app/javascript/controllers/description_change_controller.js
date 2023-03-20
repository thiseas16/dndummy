import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="description-change"
export default class extends Controller {
  static targets = ["descriptionlist", "descriptionimage"]
  connect() {
    console.log('i am bro')
  }

  change(event) {
    const description = event.target.getAttribute('data-information')
    this.descriptionlistTarget.innerHTML = description

    const picture = event.target.getAttribute('data-image')
    console.log(picture)
    myImage.src = picture

    // const screenWidth = window.innerWidth
    // const screenHeight = window.innerHeight
    // myImage.style.width = `${screenWidth * 0.5}px`
    // myImage.style.height = `${screenHeight * 0.5}px`
    myImage.style.borderRadius = '20px'
    }

  unchange() {
    // this.descriptionlistTarget.innerHTML = "info"
  }
}
