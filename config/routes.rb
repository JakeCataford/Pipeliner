Pipeliner::Application.routes.draw do
  root to: "dashboard#index"

  post '/comment/create', :to => 'comment#create'


  get '/model/revise/:id', :to => 'revision#new'
  post '/model/revise/:id', :to => 'revision#create'

  resources :users
  resources :model
  match '/login', :to => 'sessions#new', :as => :login, via: [:get, :post]
  match '/auth/g/callback', :to => 'sessions#create', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
end
