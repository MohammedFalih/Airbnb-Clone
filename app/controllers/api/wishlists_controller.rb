module Api
  class WishlistsController < ApplicationController
    protect_from_forgery with: :null_session

    def create
      wishlist = Wishlist.create!(wishlist_params)

      respond_to do |format|
        format.json do
          render json: wishlist.to_json, status: :ok
        end
      end
    end

    def destroy
      wishlist = Wishlist.find(params[:id])
      wishlist.destroy

      render json: { message: "Wishlist item successfully deleted" }, status: :ok
    end

    private

    def wishlist_params
      params.require(:wishlist).permit(:property_id, :user_id)
    end
  end
end
