class UserRecipesController < ApplicationController
  def create
    RecipeDatabaseService.new.save_user_recipe(params[:user_id], params[:recipe_id])
    require 'pry';binding.pry
  end

  def destroy

  end
end