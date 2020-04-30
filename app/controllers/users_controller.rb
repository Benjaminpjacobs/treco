class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end
  private

  def user_params
    params.require(:user).permit(:email_address, :first_name, :last_name,:password)
  end
end