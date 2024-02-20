Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/signup" => "users#new", as: :signup
  get "/login" => "sessions#new", as: :login
  post "/login" => "sessions#create"
  delete "/login" => "sessions#destroy", as: :logout
  resources :users
  resources :recipes do
    resources :comments
  end
  get "/:id" => "recipes#details"

  # Defines the root path route ("/")
  root "recipes#index", as: :root_path
end
