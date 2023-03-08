Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :campaigns, only: %i[index new create show destroy] do
    get '/dice', to: 'campaign#dice'
    resources :encounters, only: %i[new create index]
    resources :characters, only: %i[index new create show edit update destroy]
    resources :background, only: %i[new create]
    resources :art, only: %i[new create index]
    resources :random_character, only: %i[new create]
  end
  get '/handbook', to: 'handbook#home'  #all the following could also be in only 1 action, depending how we impliment this
  get '/handbook/spells', to: 'handbook#spells'
  get '/handbook/classes', to: 'handbook#classes'
  get '/handbook/races', to: 'handbook#races'
  get '/handbook/skills', to: 'handbook#skills'
  get '/handbook/traits', to: 'handbook#traits'
end
