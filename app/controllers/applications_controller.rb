class ApplicationsController < ApplicationController

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
    @application = Application.create(app_params)
      redirect_to "/applications/#{@application.id}"
  end

private

  def app_params
    params.permit(:first_name, :last_name, :street_address, :city, :state, :zip_code)
  end
end
