import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    
    connect() {
        console.log("amenities connected");
    }

    toggleDescriptionModal() {
        document.getElementById("description").click();
    }
}
