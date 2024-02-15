class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @my_pets = current_user.pets
    @my_bookings = current_user.bookings
  end
end
