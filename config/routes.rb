Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/projects', to: 'projects#index'
  resources :users, only: [:new, :create]
  get '', to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'

  resources 'projects'
  resources 'issues', only: [:show, :new, :create, :edit, :update, :destroy]
  resources 'comments', only: [:create]
end
