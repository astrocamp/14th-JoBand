import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["likeBtn", "count"];

  connect() {
    const { id, liked } = this.element.dataset;
    this.id = id;
    this.liked = liked === "true";
  }

  toggle(e) {
    e.preventDefault();

    // API
    const url = `/api/v1/posts/${this.id}/like`;
    const token = document.querySelector("meta[name=csrf-token]").content;
    const method = this.liked ? "DELETE" : "POST";

    fetch(url, {
      method: method,
      headers: {
        "X-CSRF-Token": token,
      },
    })
      .then((resp) => {
        return resp.json();
      })
      .then(({ liked, like_count }) => {
        this.liked = liked;
        this.likeBtnTarget.textContent = liked ? "♥" : "♡";
        this.countTarget.textContent = like_count;
      })
      .catch((err) => {
        console.log(err);
      });
  }
}
