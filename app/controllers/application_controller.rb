class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :ensure_valid_email

 def after_sign_in_path_for(resource)
    "/users/edit"
  end

  def ensure_valid_email
    # Ensure we don't go into an infinite loop
    return if action_name == 'add_email'

    # If the email address was the temporarily assigned one,
    # redirect the user to the 'add_email' page
    if current_user && (!current_user.email || current_user.email == User::TEMP_EMAIL)
      redirect_to add_user_email_path(current_user)
    end
  end

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.superadmin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end
end
