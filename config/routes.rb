Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "welcome#index"
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :recipes, only: [:index, :show, :new, :create]
  resources :recipes_advanced_search, only: [:index]



  get '/verify/phone', to: 'verification#show_verification_form', as: 'show_verification_form'
  post 'verify/send_code', to: 'verification#send_code', as: "send_code"

  post "verify/verify_code", to: "verification#verify_code", as: "verify_code"
  get "verify/show_confirmation_form", to: "verification#show_confirmation_form", as: "show_confirmation_form"
  

  resources :dashboard, only: [:index]
  resources :user_recipes, only: [:create]
  delete "/user_recipes", to: "user_recipes#destroy" # hand-rolled to avoid needing an ID

end
