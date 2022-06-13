import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "text", "value" ]

  connect() {
    this.originalText = this.textTarget.innerText
  }

  copy() {
    navigator.clipboard.writeText(this.valueTarget.value).then(() => {
      this.textTarget.innerText = "Copied";
      setTimeout(() => {
        this.textTarget.innerText = this.originalText;
      }, 2000);
    }, function() {
      /* clipboard write failed */
    });
  }
}
