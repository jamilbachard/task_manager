import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  connect() {
    this.messageTargets.forEach(message => {
      setTimeout(() => {
        message.style.opacity = '0'
        message.style.transform = 'translateY(-100%)'
        
        message.addEventListener('transitionend', () => {
          message.remove()
        })
      }, 4000)
    })
  }

  remove(event) {
    event.target.remove()
  }
} 