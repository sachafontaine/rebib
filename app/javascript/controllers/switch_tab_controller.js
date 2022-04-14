import { Controller } from "@hotwired/stimulus"
import { end, variationPlacements } from "@popperjs/core"

export default class extends Controller {
  static targets = [ "tab", "content" ]

  switch(event) {
    event.preventDefault();
    this.tabTargets.forEach((tab) => {
      if (tab.dataset.tabName == event.currentTarget.dataset.tabName) {
        tab.classList.add("active")
      } else {
        tab.classList.remove("active")
      }
    });
    this.contentTargets.forEach((content) => {
      if (content.dataset.tabName == event.currentTarget.dataset.tabName) {
        content.classList.remove("d-none")
      } else {
        content.classList.add("d-none")
      }
    });
  }
}
