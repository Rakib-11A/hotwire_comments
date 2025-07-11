import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "button"]

  connect() {
    console.log("Reply controller connected to:", this.element)
  }

  toggle(event) {
    event.preventDefault();
    console.log("Toggle action is triggered.........")
    const commentId = event.currentTarget.dataset.commentId;
    const form = document.getElementById(`reply-form-${commentId}`);
    form.classList.toggle("hidden")
  }
}