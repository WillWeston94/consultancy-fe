Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "welcome#index"
  get "/login", to: "users#login"
  get "/register", to: "users#register"
  
  resources :users, only: [:create]
end
