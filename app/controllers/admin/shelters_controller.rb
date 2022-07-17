class Admin::SheltersController < ApplicationController

  def index
    @shelters = Shelter.order_by_reverse_alphabetical
    
    @shelters_with_pending_apps = Shelter.with_pending_apps
  end

end