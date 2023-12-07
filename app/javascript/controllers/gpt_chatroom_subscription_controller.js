import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
// Connects to data-controller="gpt-chatroom-subscription"
export default class extends Controller {
  static values = { gptChatroomId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "GptChatroomChannel", id: this.gptChatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data)}
    )
  }

  resetForm(event) {
    event.target.reset()
  }

  keysendmessage(event) {
    if (event.key === 'Enter' && !event.shiftKey) {
      //event.preventDefault();
      event.target.form.requestSubmit();
      event.currentTarget.reset();
    }
  }

  #insertMessageAndScrollDown(data) {
    // Logic to know if the sender is the current_user
    const currentUserIsSender = this.currentUserIdValue === data.sender_id

    // console.log(currentUserIsSender)

    // Creating the whole message from the `data.message` String
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)

    // Inserting the `message` in the DOM
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

}
