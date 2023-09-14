import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["likeBtn", "count"];

  connect() {
    const { id, liked } = this.element.dataset;
    this.id = id;
    this.liked = liked === "true";

    this.updateLikeAppearance();
  }

  toggle(e) {
    e.preventDefault();

    // API
    const url = `/api/v1/posts/${this.id}/like`;
    const token = document.querySelector("meta[name=csrf-token]").content;

    fetch(url, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": token,
      },
    })
      .then((resp) => {
        return resp.json();
      })
      .then(({ liked, likeCount }) => {
        this.liked = liked;
        this.updateLikeAppearance();
        this.countTarget.textContent = likeCount;
      })
      .catch((err) => {
        console.log(err);
      });
  }

  updateLikeAppearance() {
    this.likeBtnTarget.textContent = this.liked ? "♥" : "♡";
  }
}
