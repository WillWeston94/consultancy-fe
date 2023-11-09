class RecipeDatabaseService
  def conn
    # Faraday.new(url: "https://consultancy-be-428b342c7047.herokuapp.com")
    Faraday.new(url: "http://localhost:3000") #enable for local
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def recipes_by_keyword(search)
    get_url("/api/v1/search?q=#{search}")
  end

  def recipes_by_keyword_with_intolerances(search, intolerances)
    get_url("/api/v1/search?q=#{search}&intolerances=#{intolerances}")
  end

  def find_recipe(id)
    get_url("/api/v1/search/#{id}")
  end

  def user_recipes(user_id)
    get_url("/api/v1/user_recipes?user_id=#{user_id}")
  end

  def save_user_recipe(user_id, recipe_id)
    conn.post("/api/v1/user_recipes?user_id=#{user_id}&recipe_id=#{recipe_id}")
  end

  def destroy_user_recipe(user_id, recipe_id)
    conn.delete("/api/v1/user_recipes?user_id=#{user_id}&recipe_id=#{recipe_id}")
  end

  def create_recipe(params)
    conn.post("/api/v1/recipes", params.to_json)
  end
end