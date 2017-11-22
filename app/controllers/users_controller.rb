class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # corresponding attributes set from params hash
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    # checks if user created has been saved to db
    if @user.save
      # if saved successfully flash message and send user to root path
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      redirect_to root_path
    else
      # flash error message and send user to new view
      flash.now[:alert] = "There was an error creating your account.
      Please try again."
      render :new
    end
  end
#ends class
end
