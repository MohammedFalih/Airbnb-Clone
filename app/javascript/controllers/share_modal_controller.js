import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

    copyLink() {
        navigator.clipboard.writeText(this.element.dataset.shareUrl).then(() => {
            alert("Copied to clipboard");
        });
    }

    whatsappShare() {
        window.open(`https://web.whatsapp.com:/send?text=${this.element.dataset.shareUrl}`);
    }


    twitterShare() {
    }

    facebookShare() {
    }

    emailShare() {
    }

    embedLink() {
    }

    messengerShare() {
    }

    messagesShare() {
    }
}