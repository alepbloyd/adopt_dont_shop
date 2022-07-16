class ApplicationController < ActionController::Base

  helper_method :cart

  def cart
    @cart ||= Cart.new(session[:cart])
  end

  def welcome
  end

  private

  def error_message(errors)
    errors.full_messages.join(', ')
  end
end
