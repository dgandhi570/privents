Rails.application.routes.draw do
  devise_for :users
  get 'events/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users 
    resources :events  # Defines the root path route ("/")
  root "events#index"
end
