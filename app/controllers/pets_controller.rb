class PetsController < ApplicationController
<<<<<<< HEAD
  def show
    @pet = Pet.find(params[:id])
=======
  def index
    @pets = Pet.all
>>>>>>> ba6fdc51df28dab868eb91845d14b85bbed13966
  end
end
