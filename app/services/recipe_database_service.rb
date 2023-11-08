class RecipeDatabaseService
  def conn
    Faraday.new(url: "http://localhost:3000")
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
end