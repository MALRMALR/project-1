Rails.application.routes.draw do

  resources :comments

  root to: 'welcome#index'

  # Sessions
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :posts do
    resources :comments
  end
end
