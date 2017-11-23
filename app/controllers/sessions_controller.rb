class SessionsController < ApplicationController
  def new
  end

  def create
    # search db for user of specified email in params hash
    user = User.find_by(email: params[:session][:email].downcase)
    # verify user has value and password in params hash match one given
    if user && user.authenticate(params[:session][:password])
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    # delete user's session and alerts they have been logged out & redirect user
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
# ends Class
end
