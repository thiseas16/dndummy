Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :campaigns, only: %i[create show destroy] do
    get '/dice', to: 'campaign#dice'
    get '/handbook', to: 'handbook#home'
    resources :encounters, only: %i[new index]
    resources :characters, only: %i[index new create show edit update destroy]
    resources :random, only: %i[new]
  end
end
