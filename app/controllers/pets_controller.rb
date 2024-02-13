class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @pet = Pet.find(params[:id])
    @booking = Booking.new
    @pets = Pet.all

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end
  end

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to @pet, redirect_to: root_path
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :description, :address, :image_url)
  end
end
