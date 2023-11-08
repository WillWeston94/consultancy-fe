class DashboardFacade
  attr_reader :recipes
  def initialize(user_id)
    @recipes = fetch_user_recipes(user_id)
  end

  def fetch_user_recipes(user_id)
    recipes = RecipeDatabaseService.new.user_recipes(user_id)

    recipes[:data].map {|recipe| Recipe.new(recipe)}
  end
end