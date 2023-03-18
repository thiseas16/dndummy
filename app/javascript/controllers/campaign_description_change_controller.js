import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="campaign-description-change"
export default class extends Controller {
  static targets = ["description", "header"]
  connect() {
    console.log('i am bro')
  }

  change1(event) {
    const description = "Roll the dice and test your luck! With our easy-to-use dice roller, you can roll any combination of dice quickly and easily. Choose the number of dice and the number of sides, and let the RNG gods decide your fate. Whether you're playing solo or with a group, our dice roller will make sure you're always ready for whatever adventure awaits. Plus, our user-friendly interface allows you to save your rolls for future use or easily reroll if needed."
    this.descriptionTarget.innerHTML = description
    const header = "Roll The Dice"
    this.headerTarget.innerHTML = header
    // const screenWidth = window.innerWidth
    // const screenHeight = window.innerHeight
  }

  change2(event) {
    const description = "Need some visuals for your campaign or characters? Our AI image generator has got you covered. With our easy-to-use interface, you can create stunning images for your campaign or character portraits that look like they were made by a professional artist. Choose from a variety of options to create the perfect image, such as selecting the style or genre of image you want to create, or even specific features like clothing, hair color, and accessories. Our AI image generator is perfect for those who want to bring their game to life and add some visual flair to their game."
    this.descriptionTarget.innerHTML = description
    const header = "Generate Stunning Visuals"
    this.headerTarget.innerHTML = header
    // const screenWidth = window.innerWidth
    // const screenHeight = window.innerHeight
  }

  change3(event) {
    const description = "Welcome to your gateway to the world of Dungeons and Dragons! Our character portal is your one-stop-shop for managing all your characters in one place. Whether you're a seasoned player or just starting out, our portal allows you to create new characters, check out their stats, and keep track of their progress. Plus, with easy-to-use tools and an intuitive interface, you can easily manage all your characters with just a few clicks. You can even share your characters with others, get feedback and collaborate with other players."
    this.descriptionTarget.innerHTML = description
    const header = "Manage Your Characters"
    this.headerTarget.innerHTML = header
    // const screenWidth = window.innerWidth
    // const screenHeight = window.innerHeight
  }

  change4(event) {
    const description = "Looking for some new challenges for your campaign? Our encounter portal is the perfect place to get inspired. Generate random encounters or customize your own to create the perfect adventure for your party. Plus, with the ability to manage your previous encounters, you'll always have a wealth of ideas and inspiration at your fingertips. Whether you're looking to create a challenging battle, or an immersive story, our encounter portal can help you get started. With easy-to-use tools, you can quickly create unique encounters that will keep your players engaged and entertained. The portal also offers other helpful resources, like encounter planners, enemy generators, and more, so you can focus on what really matters: having fun!"
    this.descriptionTarget.innerHTML = description
    const header = "Manage Your Encounters"
    this.headerTarget.innerHTML = header
    // const screenWidth = window.innerWidth
    // const screenHeight = window.innerHeight
  }
}
