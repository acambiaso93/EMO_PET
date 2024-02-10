class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new
  end

  def index
    @pets = Pet.all
  end
end
