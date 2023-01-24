Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/projects', to: 'projects#index'
  resources 'projects'
  resources 'issues', only: [:show, :new, :create, :edit, :update, :destroy]
  resources 'comments', only: [:create]
end
