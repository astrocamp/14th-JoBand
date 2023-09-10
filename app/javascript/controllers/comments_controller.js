import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = ["content"];

  connect() {}

  toggleContent(e) {
    e.preventDefault();
    const currentTargetId = e.currentTarget.dataset.linkId;
    const targetContent = this.contentTargets.find(
      (target) => target.dataset.linkId === currentTargetId
    );
    const displayStatus = targetContent.style.display;
    if (displayStatus === "none") {
      targetContent.style.display = "block";
    } else {
      targetContent.style.display = "none";
    }
  }
}
