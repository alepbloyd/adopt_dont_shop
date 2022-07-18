class ApplicationpetsController < ApplicationController

  def update
    @application_pet = ApplicationPet.where(["application_id = ?", params[:application_id]]).where(["pet_id = ?", params[:pet_id]])
    
    @application_pet.update(pet_app_status: params[:pet_app_status])

    redirect_to "/admin/applications/#{params[:application_id]}"

  end

  private

  def app_pet_params
    params.permit(:pet_app_status,:pet_id,:application_id)
  end

end