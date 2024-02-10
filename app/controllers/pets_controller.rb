class PetsController < ApplicationController
  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new()

  end

  def index
    @pets = Pet.all
  end

  private

  def bb

  end
end
