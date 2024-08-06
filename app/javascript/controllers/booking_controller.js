import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ["baseFare", "numberOfNights", "serviceFee", "totalAmount"]
    SERVICE_FEE = 0.18;

    connect() {
        this.updateDetails();
    }

    updateDetails() {
        this.baseFareTarget.textContent = this.calculateBaseFare.toFixed(2);
        this.numberOfNightsTarget.textContent = this.numberOfNights;
        this.serviceFeeTarget.textContent = this.calculateServiceFee.toFixed(2);
        this.totalAmountTarget.textContent = this.calculateTotalAmount.toFixed(2);
    }

    get numberOfNights() {
        return 10;
    }

    get calculateBaseFare() {
        return this.numberOfNights * parseFloat(this.element.dataset.perNightPrice);
    }

    get calculateServiceFee() {
        return this.calculateBaseFare * this.SERVICE_FEE;
    }

    get calculateTotalAmount() {
        return this.calculateBaseFare + this.calculateServiceFee;
    }
}
