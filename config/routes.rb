Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :campaigns, only: %i[index new create show destroy] do
    get '/dice', to: 'campaigns#dice'
    resources :encounters, only: %i[new create index]
    # resources :characters, only: %i[index new create show edit update destroy]
    get '/characters', to: 'campaigns#characters'
    post '/characters', to: 'characters#create'
    resources :background, only: %i[new create]
    resources :art, only: %i[new create index]
    resources :random_character, only: %i[new create]
  end
  scope '/handbook' do
    get '', to: 'handbook#home', as: 'handbook'
    # Spells
    get 'spells', to: 'handbook#spells_index'
    get 'spells/:id', to: 'handbook#spells_show', as: 'spells_show'
    # Classes
    get 'classes', to: 'handbook#classes_index'
    get 'classes/:id', to: 'handbook#classes_show', as: 'classes_show'
    # Races
    get 'races', to: 'handbook#races_index'
    get 'races/:id', to: 'handbook#races_show', as: 'races_show'
    # Traits
    get 'traits', to: 'handbook#traits_index'
    get 'traits/:id', to: 'handbook#traits_show', as: 'traits_show'
    # Equipment
    get 'equipment', to: 'handbook#equipment_index'
    get 'equipment/:id', to: 'handbook#equipment_show', as: 'equipment_show'
    # Feats
    get 'feats', to: 'handbook#feats_index'
    get 'feats/:id', to: 'handbook#feats_show', as: 'feats_show'
    # Languages
    get 'languages', to: 'handbook#languages_index'
    get 'languages/:id', to: 'handbook#languages_show', as: 'languages_show'
    # Proficiencies
    get 'proficiencies', to: 'handbook#proficiencies_index'
    get 'proficiencies/:id', to: 'handbook#proficiencies_show', as: 'proficiencies_show'
  end
end
