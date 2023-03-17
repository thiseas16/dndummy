import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="campaign-description-change"
export default class extends Controller {
  static targets = ["description"]
  connect() {
    console.log('i am bro')
  }

  change1(event) {
    console.log(event.target)
    const description = "Roll the dice and test your luck! With just a few clicks, you'll have your roll in seconds. Whether you're playing solo or with a group, our dice roller will make sure you're always ready for whatever adventure awaits."
    console.log(description)
    this.descriptionTarget.innerHTML = description

    // const screenWidth = window.innerWidth
    // const screenHeight = window.innerHeight
  }

  change2(event) {
    const description = "Welcome to your gateway to the world of Dungeons and Dragons! Here, you can manage all your characters in one place, create new ones, and check out their stats and progress. It's the perfect place to get lost in character creation and let your imagination run wild."
    this.descriptionTarget.innerHTML = description

    // const screenWidth = window.innerWidth
    // const screenHeight = window.innerHeight
  }

  change3(event) {
    const description = "Need some visuals for your campaign or characters? Our AI image generator has got you covered. With just a few clicks, you can generate stunning images for your campaign or character portraits that look like they were made by a professional artist. It's the perfect tool for bringing your game to life."
    this.descriptionTarget.innerHTML = description

    // const screenWidth = window.innerWidth
    // const screenHeight = window.innerHeight
  }

  change4(event) {
    const description = "Looking for some new challenges for your campaign? Our encounter portal is the place to be. Generate random encounters or customize your own to create the perfect adventure for your party. Plus, with the ability to manage your previous encounters, you'll always have a wealth of ideas and inspiration at your fingertips."
    this.descriptionTarget.innerHTML = description

    // const screenWidth = window.innerWidth
    // const screenHeight = window.innerHeight
  }


}
