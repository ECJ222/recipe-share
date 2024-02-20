import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.addSocialShareListener()
  }
  addSocialShareListener() {
    const socialShareButton = document.getElementById('social-share-btn')
    socialShareButton.addEventListener('click', this.openSocialShareModal.bind(this))
  }
  openSocialShareModal() {
    const socialShareModal = document.querySelector('.social-share-modal')
    socialShareModal.classList.remove('hidden')
    this.addCloseSocialShareListener()
  }
  closeSocialShareModal() {
    const socialShareModal = document.querySelector('.social-share-modal')
    socialShareModal.classList.add('hidden')
  }
  addCloseSocialShareListener() {
    const closeButton = document.querySelector('.social-share-modal .close-btn')
    closeButton.addEventListener('click', this.closeSocialShareModal.bind(this))
  }
}
