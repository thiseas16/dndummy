Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dices, only: %i[new create show]
  resources :characters, only: %i[index new create show edit update destroy]
  resources :handbooks, only: %i[index]
  end
  resources :encounters, only: %i[index new]
  resources :campaigns, only: %i[create show]
  resources :random, only: %i[new]
end
