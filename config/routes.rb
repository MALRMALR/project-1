Rails.application.routes.draw do

  root to: 'welcome#index'

  # Sessions
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :posts
  resources :tags
end
