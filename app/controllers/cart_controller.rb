class CartController < ApplicationController  
  def update

    application = Application.find(params[:app_id])

    pet = Pet.find(params[:pet_id])

    cart.add_pet(pet.id)

    session[:cart] = cart.contents

    flash[:notice] = "#{pet.name} added to your application!"

    redirect_to "/applications/#{application.id}"
    
  end
end