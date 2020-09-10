Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", passwords: "admins/passwords", registrations: "admins/registrations"}
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations"}

  root to: 'home#index'

  # # route for communication
  # mount ActionCable.server => '/cable'
  # get '/chat', to: 'chatrooms#show'
  # resources :messages, only: [:create]

  resources :profile, only: [:index, :show]

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

resources :muscles, only: [:index] do
  collection {post :import}
end

resources :variants, only: [:index] do
  collection {post :import}
end

resources :roles_muscular_group_capacities, only: [:index] do
  collection {post :import}
end

end
