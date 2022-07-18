class Admin::ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets
  end

  def update
    application_pet = ApplicationPet.where(application_id: params[:application_id]).where(pet_id: params[:pet_id])
    
    application_pet.update(pet_app_status: "Approved")

    redirect_to "/admin/applicaions/#{params[:application_id]}"
  end

end