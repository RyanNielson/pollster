import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nested-form"
export default class extends Controller {
  static targets = [ "add", "template" ]

  connect() {
    this.wrapperClass = this.data.get("wrapperClass") || "nested-fields"
  }

  addAssociation(event) {
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.addTarget.insertAdjacentHTML('beforebegin', content)
  }

  removeAssociation(event) {
    let wrapper = event.target.closest("." + this.wrapperClass)
    wrapper.remove()
  }
}
