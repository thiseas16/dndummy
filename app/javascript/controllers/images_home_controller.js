import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="campaign-description-change"
export default class extends Controller {
  static targets = ["description", "header"]
  connect() {
    console.log('i am bro')
  }

  change1(event) {
    const description = "Our campaign image generator is the perfect tool for creating stunning and abstract images for your Dungeons and Dragons campaign. With this generator, you can specify what type of image you want to create, whether it's a landscape, a battle scene, or something else entirely. You can even customize the colors, textures, and other elements of your image to suit your campaign's theme or setting. Our campaign image generator is the perfect tool for those who want to create eye-catching visuals for their game without having to spend hours creating them from scratch."
    this.descriptionTarget.innerHTML = description
    const header = "Campaign Image Generator"
    this.headerTarget.innerHTML = header
    // const screenWidth = window.innerWidth
    // const screenHeight = window.innerHeight
  }

  change2(event) {
    const description = "With our character portrait generator, you can create beautiful and unique portraits of your Dungeons and Dragons characters with ease. Simply select the character you want to generate a portrait for, and let our AI image generator do the rest. Our portrait generator allows you to customize your character's appearance, from their hair and eye color, to their facial features and accessories. You can even choose from a variety of styles, from realistic to cartoonish, to create a portrait that perfectly captures the essence of your character. With our portrait generator, you'll have a stunning image of your character that you can use for your campaign, share with other players, or simply enjoy on its own."
    this.descriptionTarget.innerHTML = description
    const header = "Character Portrait Generator"
    this.headerTarget.innerHTML = header
    // const screenWidth = window.innerWidth
    // const screenHeight = window.innerHeight
  }
}
