class UsersController < ApplicationController
  def new
  end

  def create
    user_params = params.permit(:first_name, :last_name, :email, :password)
    user_params[:email] = user_params[:email].downcase
    @user = User.new(user_params)
    if @user.save
      redirect_to :root_path
    else
      puts  "messages #{@user.errors.full_messages}"
      @errors = ['Please ensure all fields are field with the correct values.']
      render :signup, status: :unprocessable_entity
    end
  end
end
