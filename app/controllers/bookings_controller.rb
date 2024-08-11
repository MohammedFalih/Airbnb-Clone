class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @property = Property.find(params[:property_id])

    @checkin_date = Date.parse(params[:checkin_date])
    @checkout_date = Date.parse(params[:checkout_date])

    @per_night = @property.price
    @total_nights = numberOfNights
    @base_fare = @property.price * @total_nights
    @service_fee = @base_fare * 0.18
    @total_amount = @base_fare + @service_fee
  end

  private

  def numberOfNights
    checkinDate = Date.parse(params[:checkin_date])
    checkoutDate = Date.parse(params[:checkout_date])
    (checkoutDate - checkinDate).to_i
  end

  def bookingsParam
    uire(:booking).permit(:property_id, :checkin_date, :checkout_date)
  end
end
