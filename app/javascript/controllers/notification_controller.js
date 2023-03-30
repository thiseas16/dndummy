import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = ["message", "notification", "redirect"]
  connect() {
    console.log("Notifications controller connected!")
    // console.dir(this.notificationTarget.children[0].href)
    this.notificationsChannel = consumer.subscriptions.create( { channel: "NotificationsChannel" } , {
      connected(){
        // console.log("We are connected to the websocket.")
      },

      disconnected(){
        // console.log("We are disconnected from the websocket.")
      },

      received: (data) => {
        // console.log("We just received data from the websocket!");
        // this.notification_on(data);
        // console.log(data)
        this.notification_on(data)
      }
    })
  }

  disconnect(){
    consumer.subscriptions.remove(this.notificationsChannel);
  }

  notification_on(data){
    this.notificationTarget.classList.remove("invisible")
    this.notificationTarget.classList.remove("invisible_set")
    this.notificationTarget.classList.add("visible")
    this.messageTarget.innerText = data["message"]
    this.redirectTarget.href = data["redirect"]
    this.notification_sound()
    setTimeout(() => {
      this.close();
    }, 5000);
  }

  notification_sound() {
    const audio = new Audio("https://res.cloudinary.com/dnorlz2hl/video/upload/v1680038212/development/pristine-609_locafa.mp3");
    audio.play();
  }

  close() {
    console.log("close")
    this.notificationTarget.classList.add("invisible")
    this.notificationTarget.classList.remove("visible")
  }
}
