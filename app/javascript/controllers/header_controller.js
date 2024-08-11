import { Controller } from "@hotwired/stimulus"
import { enter, leave, toggle } from 'el-transition'

export default class extends Controller {
  static targets = ['dropDown', 'openUserMenu']

  connect() {
    this.openUserMenuTarget.addEventListener("click", (e) => {
      openDropdown(this.dropDownTarget)
    })
  }
}

function openDropdown(element) {
  toggle(element)
}