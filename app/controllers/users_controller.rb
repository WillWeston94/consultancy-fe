class UsersController < ApplicationController
  def login

  end

  def register
    @user = User.new
  end
end