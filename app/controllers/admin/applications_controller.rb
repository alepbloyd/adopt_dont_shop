class Admin::ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @application_pets = @application.application_pets.order_by_recently_created
    @pets = @application.pets
  end

  private

  def app_params
    params.permit(:first_name, :last_name, :street_address, :city, :state, :zip_code,:decision)
  end
  

end