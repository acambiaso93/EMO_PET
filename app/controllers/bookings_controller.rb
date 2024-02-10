class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:destroy]

  def show
    @bookings = Booking.find(params[:id])
    @booking = Booking.new
  end

  def index
    @my_bookings = current_user.bookings
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end
end
