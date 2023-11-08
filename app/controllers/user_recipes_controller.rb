class UserRecipesController < ApplicationController
  def create
    RecipeDatabaseService.new.save_user_recipe(params[:user_id], params[:recipe_id])
    flash[:success] = "Recipe was saved and can be viewed at any time from your dashboard!"
    # render current view
  end

  def destroy
    RecipeDatabaseService.new.destroy_user_recipe(params[:user_id], params[:recipe_id])
    flash[:success] = "Recipe was removed from your dashboard!"
    redirect_to dashboard_index_path
  end
end