Rails.application.routes.draw do
  get 'sports/import'
  devise_for :users

  root to: 'home#index'

  # route for communication
  mount ActionCable.server => '/cable'
  get '/chat', to: 'chatrooms#show'
  resources :messages, only: [:create]

  resources :sports do
    collection {post :import}
  end

  resources :home, only: [:index] do
    collection {get :import}
  end

  resources :sport_roles, only: [:index] do
    collection {post :import}
  end

  resources :qualities, only: [:index] do
    collection {post :import}
  end

  resources :capacities, only: [:index] do
    collection {post :import}
  end

  resources :muscular_groups, only: [:index] do
    collection {post :import}
  end

  resources :training_methods, only: [:index] do
    collection {post :import}
  end

  resources :exercises, only: [:index] do
    collection {post :import}
  end

resources :intensities, only: [:index] do
  collection {post :import}
end

resources :levels, only: [:index] do
  collection {post :import}
end

resources :extypes, only: [:index] do
  collection {post :import}
end

end
