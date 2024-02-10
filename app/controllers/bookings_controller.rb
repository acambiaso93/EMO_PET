class BookingsController < ApplicationController
  before_action :authenticate_user!

  def show
    @bookings = Booking.find(params[:id])
    @booking = Booking.new
  end

  def index
    @my_bookings = current_user.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :template, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_id)
  end
end
