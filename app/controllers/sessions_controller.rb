class SessionsController < ApplicationController
  skip_before_action :require_user_logged_in, only: [:new, :create]

  def new
  end

  def create
      @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password]) 
      session[:user_id] = @user.id
      redirect_to :root_path
    else
      @errors = ['Invalid email or password']
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
      session[:user_id] = nil
      redirect_to :login
  end
end