class ApplicationsController < ApplicationController

  def admin_show
    @application = Application.find(params[:id])
    @application_pets = @application.application_pets.order_by_recently_created
    @pets = @application.pets
  end

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
    @cart = Cart.new(session[:cart])
    @pets_search = []

    if params[:pet_name_search].present?
      @pets_search = Pet.case_insenstive_search(params[:pet_name_search])
    end

  end

  def new
  end

  def create
    @application = Application.new(app_params)
      if @application.save
        redirect_to "/applications/#{@application.id}"
      else
        redirect_to "/applications/#{@application.id}/new"
        flash[:alert] = "Error: #{error_message(@application.errors)}"
      end
  end

private

  def app_params
    params.permit(:first_name, :last_name, :street_address, :city, :state, :zip_code)
  end
end
