class PetsController < ApplicationController
  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.save
    redirect_to_bookings_path(@booking)
  end

  def index
    @pets = Pet.all
  end

  private

  def bb

  end
end
