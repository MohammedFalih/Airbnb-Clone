import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    updateWishlist() {
        const userLoggedIn = this.element.dataset.userLoggedIn;

        if (userLoggedIn === "false") {
            document.querySelector(".js-login").click();
            return;
        }

        if (this.element.dataset.status === "false") {
            const userId = this.element.dataset.userId;
            const propertyId = this.element.dataset.propertyId;
            this.addPropertyToWishlists(propertyId, userId);
        } else {
            const wishlistId = this.element.dataset.wishlistId;
            this.removePropertyFromWishlist(wishlistId);
        }
    }

    addPropertyToWishlists(propertyId, userId) {
        const apiUrl = '/api/wishlists'; // Ensure the URL is correct
        const data = {
            wishlist: {
                property_id: propertyId,
                user_id: userId,
            }
        };

        const requestOptions = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        };

        fetch(apiUrl, requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log(data);
                this.element.style.fill = "#FF5A5F";
                this.element.dataset.status = "true";
                this.element.dataset.wishlistId = data.id; 
            })
            .catch(error => {
                console.error(error);
            });
    }

    removePropertyFromWishlist(wishlistId) {
        fetch(`/api/wishlists/${wishlistId}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
            }
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            this.element.style.fill = "none";
            this.element.dataset.status = "false";
            this.element.dataset.wishlistId = '';
        })
        .catch(error => {
            console.error(error);
        });
    }
}
