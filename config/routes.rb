Rails.application.routes.draw do
  get 'states/index'
  get 'states/show'
  get "home/index"
  resources :universities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
end
