class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
    pet_for_marker = Pet.where(id: params[:id])
    @booking = Booking.new
    @pets = Pet.all
    @markers = pet_for_marker.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {pet: pet})
      }
    end
  end

  def index
    @pets = policy_scope(Pet)
    if params[:query].present?
      @pets = Pet.search_by_name_and_breed_and_description(params[:query])
    end

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end

  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    authorize @pet

    if @pet.save
      redirect_to @pet, redirect_to: root_path
    else
      render :new
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.destroy
    redirect_to root_path, notice: 'Pet was successfully killed.'
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :description, :address, :image_url)
  end
end
