import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    
    connect() {
        console.log("amenities connected");
    }

    toggleAmenitiesModal() {
        document.getElementById("amenities").click();
    }
}
