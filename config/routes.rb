Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'openai', to: 'openai#index'
  post 'openai/generate'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :campaigns, only: %i[index new create show destroy] do
    get '/dice', to: 'campaigns#dice'
    resources :encounters, only: %i[new create index]
    resources :characters, only: %i[index new create show edit update destroy]
    #post '/create_character', to: 'campaigns#create_character'
    #post '/generate_response', to: 'characters#generate_response'
    resources :backgrounds, only: %i[new create]
    get '/images/all', to: 'images#all', as: 'all_images'
    resources :images, only: %i[new create index]
    get '/images/portrait/new', to: 'images#new_portrait', as: 'new_portrait_image'
    post '/images/portrait', to: 'images#create_portrait', as: 'create_portrait_image'
    resources :random_characters, only: %i[new create]
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
