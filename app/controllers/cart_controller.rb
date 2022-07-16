class CartController < ApplicationController  
  def update
    # require 'pry'; binding.pry
    application = Application.find(params[:app_id])

    pet = Pet.find(params[:pet_id])

    cart.add_pet(pet.id)

    session[:cart] = cart.contents
    # pet_id_str = pet.id.to_s

    # session[:cart] ||= Hash.new(0)
    # session[:cart][pet_id_str] ||= 0
    # session[:cart][pet_id_str] = session[:cart][pet_id_str] + 1

    flash[:notice] = "#{pet.name} added to your application!"

    redirect_to "/applications/#{application.id}"
  end
end