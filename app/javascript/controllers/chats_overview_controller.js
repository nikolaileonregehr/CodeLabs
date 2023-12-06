import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chats-overview"
export default class extends Controller {
  static targets = ["content"]

  connect() {
    console.log(this.contentTarget)
  }

  revealContent(event) {
    // this.contentTarget.classList.remove("d-none")
    console.log("make fetch request to chatroom show route")
    const chatroomId = (event.currentTarget.dataset.chatroomId)

    fetch(`/chatrooms/${chatroomId}`, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.contentTarget.innerHTML = data
    })
  }
}
