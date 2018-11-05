Rails.application.routes.draw do
  resources :relationships
  resources :reviews
  resources :restaurants
  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
