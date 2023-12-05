import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="togglesidebar"
export default class extends Controller {
  static targets = ["collapsebtn", "sidebar", "chaptercontent"]
  connect() {
  }

  toggleSidebar() {
    this.sidebarTarget.classList.toggle("hidden-content");
    this.collapsebtnTarget.classList.toggle("movebtn");
    this.chaptercontentTarget.classList.toggle("movecontent");
  }
}
