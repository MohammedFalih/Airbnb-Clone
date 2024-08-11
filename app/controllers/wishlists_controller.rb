class WishlistsController < ApplicationController
  before_action :authenticate_user!
  def index
    @properties = current_user.wishlisted_properties.order(created_at: desc)
  end
end
