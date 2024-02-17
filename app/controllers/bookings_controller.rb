class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:destroy]
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def show
    @booking = Booking.find(params[:id])
    @pet = @booking.pet
    @booking = Booking.new
  end

  def index
    @my_bookings = policy_scope(Booking)
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path, notice: 'You dont like the pet anymore!.'
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :template, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_id)
  end
end
