class RecipeAdvancedSearchFacade
  attr_reader :search
  def initialize(search, filtered_params)
    @search = search
    @filtered_params = filtered_params
  end

  def recipes
    data = RecipeDatabaseService.new.recipes_by_keyword(combine_filters)

    data[:data].map do |recipe_data|
      Recipe.new(recipe_data)
    end
  end

  private


  #This combine filters turned really ugly.  This will definitely need to be refactored
  def combine_filters  
    search = [@search]

    no_underscore_hash = Hash.new(0)
    
    @filtered_params.each do |k,v|
      no_underscore_k = k.gsub("_", " ")
      no_underscore_hash[no_underscore_k] = v
    end

    no_underscore_hash.each do |k,v|
      search << k if v == "1"
    end

    search.join(" ")
  end
end