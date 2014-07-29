class UsersController < ApplicationController
  before_action :set_user, :add_email, :except => [:update_invite_user_status, :update_profile]

  def update_invite_user_status
    @user = User.find(params[:user_id])
    @user.update_attribute('invite_user',params[:status])
    UserMailer.invite_user(@user).deliver if @user.invite_user == true
    render :json => {:status => "ok"}.to_json
  end

  def add_email
    if params[:user] && params[:user][:email]
      current_user.email = params[:user][:email]
      current_user.skip_reconfirmation! # don't forget this if using Devise confirmable
      respond_to do |format|
        if current_user.save
          format.html { redirect_to current_user, notice: 'Your email address was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { @show_errors = true }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update_profile
    @user = current_user
    @user.update_attributes(:profile_pic => params[:user][:profile_image],:cover_pic => params[:user][:cover_image],:profile_name => params[:user][:profile_name],:facebook_link => params[:user][:facebook_link], :twitter_link => params[:user][:twitter_link],:website_link=>params[:user][:website_link],:location =>params[:user][:location])
    redirect_to :back
  end

end
