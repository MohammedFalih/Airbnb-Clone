import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    updateWishlist() {
        const userLoggedIn = this.element.dataset.userLoggedIn;

        if (userLoggedIn === "false") {
            document.querySelector(".js-login").click();
            return;
        }

        if (this.element.dataset.status === "false") {
            this.element.style.fill = "#FF5A5F"; 
            this.element.dataset.status = "true";
        } else {
            this.element.style.fill = "none";
            this.element.dataset.status = "false";
        }
    }
}
