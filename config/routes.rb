Rails.application.routes.draw do
  # get "states/index"
  # get "states/show"
  # get "home/index"
  resources :universities
  resources :states, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
end
