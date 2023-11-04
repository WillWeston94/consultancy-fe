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
end