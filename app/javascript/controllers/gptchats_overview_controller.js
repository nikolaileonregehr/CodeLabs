import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gptchats-overview"
export default class extends Controller {
  static targets = ["content"]

  connect() {
    console.log(this.contentTarget)
  }

  revealContent(event) {
    // this.contentTarget.classList.remove("d-none")
    console.log("make fetch request to chatroom show route")
    const GptChatroomId = (event.currentTarget.dataset.gptchatroomId)
    console.log(event.currentTarget.dataset)

    fetch(`/gpt_chatrooms/${GptChatroomId}`, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.contentTarget.innerHTML = data
      console.log(data)
    })
  }
}
