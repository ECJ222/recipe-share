import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.addCreateRecipeButtonListener()
  }
  addCreateRecipeButtonListener() {
    const createRecipeButton = document.getElementById('create-recipe-btn')
    createRecipeButton.addEventListener('click', this.openRecipeForm.bind(this))
  }
  openRecipeForm() {
    const createRecipeForm = document.querySelector('.create-recipe-form')
    createRecipeForm.classList.remove('hidden')
    this.addCloseRecipeFormListener()
  }
  closeRecipeForm() {
    const createRecipeForm = document.querySelector('.create-recipe-form')
    createRecipeForm.classList.add('hidden')
  }
  addCloseRecipeFormListener() {
    const closeRecipeFormButton = document.querySelector('.create-recipe-form .close-btn')
    closeRecipeFormButton.addEventListener('click', this.closeRecipeForm.bind(this))
  }
}
