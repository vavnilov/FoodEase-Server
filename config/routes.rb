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

  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
