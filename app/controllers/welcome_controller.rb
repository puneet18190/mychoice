class WelcomeController < ApplicationController
  def landing
    if user_signed_in?
      redirect_to "/users/edit"
    end
  end
end
