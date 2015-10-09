class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # def find_email
  #   if user_signed_in? 
  #   current_user.email
  #   end
  # end
  def logged_in?
    session[:logged_in]
  end
end
