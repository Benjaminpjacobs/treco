class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new; end

  def create
    @user = User.find_by(email_address: params[:email_address])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/dashboard'
    else
       redirect_to '/login'
    end
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
    redirect_to '/welcome'
  end

  def login; end

  def welcome; end

  def page_requires_login; end
end
