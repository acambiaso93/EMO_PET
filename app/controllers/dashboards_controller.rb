class DashboardsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def show
    @my_pets = current_user.pets
    @my_bookings = current_user.bookings
  end
end
