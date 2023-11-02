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
      flash[:error] = user.errors.full_messages.to_sentence
      redirect_to register_path # due to form_with model, this changes the route to /users if we only render, so forcing a redirect instead
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end