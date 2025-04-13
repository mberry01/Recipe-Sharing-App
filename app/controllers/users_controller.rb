class UsersController < ApplicationController
  allow_unauthenticated_access only: [ :new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for(@user)
      redirect_to main_path
    else
      flash.now[:alert] = "There was a problem signing up."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = Current.session&.user
    redirect_to new_session_path, alert: "You must be logged in to view your profile." unless @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end

end
