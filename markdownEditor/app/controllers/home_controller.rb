class HomeController < ApplicationController
    before_filter :authenticate_user!

  def textEditor
    
  end
  # if user_signed_in? 
  #   current_user.email
  # end
end
