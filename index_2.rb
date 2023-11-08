# <%= form_with url: recipes_path, method: :get, local: true, data: {turbo: false}, class: "default-search-form" do |f| %>
#   <%= f.text_field :search, placeholder: "Search by Ingredients..." %>
#   <%= f.submit "Search" %>
# <% end %>

# <br><%= button_to "Advanced Search", recipes_advanced_search_index_path, method: :get, data: { turbo: false } %>

# <div class = "container">
#   <div class = "row" >
#     <% @recipe_facade.recipes.each do |recipe| %>
#       <div class ="col-lg-4 col-md-6 col-sm-12">
#         <div class = "card h-100">
#           <div class = "card recipe-card">
#             <%= link_to recipe_path(recipe.id) do %>
#               <img src="<%= recipe.img_src %>" alt="<%= recipe.name %>" class="card-img-top">
#             <% end %>
#             <div class="card-body">
#               <h5 class="card-title"><%= link_to recipe.name, recipe_path(recipe.id) %></h5>
#             </div>
#           </div>
#         </div>
#       </div>
#     <% end %>
#   </div>
# </div>
