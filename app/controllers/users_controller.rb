class UsersController < ApplicationController
  def login

  end

  def register
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Registration failed!"
      render :register
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end