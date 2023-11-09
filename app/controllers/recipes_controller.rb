class RecipesController < ApplicationController
  def index
    @recipe_facade = RecipeFacade.new(params[:search])
  end

  def show
    recipe_id = params[:id]
    @recipe_facade = RecipeShowFacade.new(recipe_id)
  end

  def new
  end

  def create
    params_hash = {
      "title" => params[:title],
      "image" => params[:image],
      "servings" => params[:servings],
      "prep_time" => params[:prep_time],
      "ingredients" => params[:ingredients],
      "instructions" => params[:instructions]
    }
    s3 = Aws::S3::Resource.new(region:'us-east-1')
    bucket = s3.bucket('turingconsultancy')

    obj = bucket.object(params[:image].original_filename)
    obj.upload_file(params[:image].tempfile, acl:'private')

    params_hash["image"] = obj.public_url

    response = RecipeDatabaseService.new.create_recipe(params_hash)

    if response.status == 204
      flash[:success] = "Recipe Created Successfully"
      redirect_to "/dashboard"
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect_to "/recipes/new"
    end
  end
end