# <nav class="navbar navbar-expand-md navbar-dark bg-primary">
#       <div class="collapse navbar-collapse" id="navbarColor01">
#         <%= form_with url: recipes_path, method: :get, local: true, data: {turbo: false}, class: "header-search-form" do |f| %>
#           <%= f.text_field :search, placeholder: "Search by Ingredients..." %>
#           <%= f.submit "Search" %>
#         <% end %>
#         <ul class="navbar-nav ms-auto">
#           <% if current_user %>
#             <li class="nav-item">
#               <%= link_to "My Dashboard", dashboard_index_path, class: "nav-link" %>
#             </li>
#             <li class="nav-item">
#               <%= button_to "Log Out", destroy_user_session_path, method: :delete, data: {turbo: false}, class: "nav-link" %>
#             </li>
#           <% else %>
#             <li class="nav-item">
#               <%#= link_to "Register", register_path, class: 'nav-link' %>
#               <%= link_to "Create Account", new_user_registration_path, class: "nav-link" %>
#             </li>
#             <li class="nav-item">
#               <%#= link_to "Log In", login_path, class: 'nav-link' %>
#               <%= link_to "Login", new_user_session_path, class: "nav-link" %>
#             </li>
#           <% end %>
#         </ul>
#         <!-- <form class="form-inline my-2 my-lg-0">
#           <input class="form-control mr-sm-2" type="text" placeholder="Search">
#           <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
#         </form> -->
#       </div>
#     </nav>