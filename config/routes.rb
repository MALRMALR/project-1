Rails.application.routes.draw do

  resources :users do
    member do
      get :following, :followers
    end
  end


  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]


  # Sessions
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'



  root to: 'welcome#index'
end
