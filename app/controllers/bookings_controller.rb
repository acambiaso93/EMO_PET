class BookingsController < ApplicationController
  before_action :authenticate_user!

  def show
    @bookings = Booking.find(params[:id])
    @booking = Booking.new
  end

  def index
    @my_bookings = current_user.bookings
  end
end
