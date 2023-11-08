class RecipeAdvancedSearchFacade
  attr_reader :search
  def initialize(search, filtered_params, filtered_intolerances)
    @search = search
    @filtered_params = filtered_params
    @filtered_intolerances = filtered_intolerances
  end

  def recipes
    data = RecipeDatabaseService.new.recipes_by_keyword_with_intolerances(combine_filters, combine_intolerances)

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

  def combine_intolerances
    all_intolerances = []

    no_underscore_hash_2 = Hash.new(0)
    
    @filtered_intolerances.each do |k,v|
      no_underscore_k= k.gsub("_", " ")
      no_underscore_hash_2[no_underscore_k] = v
    end

    no_underscore_hash_2.each do |k,v|
      all_intolerances << k if v == "1"
    end

    all_intolerances.join(" ")
  end
end