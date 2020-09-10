Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", passwords: "admins/passwords", registrations: "admins/registrations"}
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations"}


  authenticated :user do
    root to: 'users#show', as: :authenticated_user_root
  end

  authenticated :admin do
    root to: 'admins#index', as: :authenticated_admin_root
  end

  unauthenticated do
    root to: 'home#index'
  end
  

  # # route for communication
  # mount ActionCable.server => '/cable'
  # get '/chat', to: 'chatrooms#show'
  # resources :messages, only: [:create]

<<<<<<< HEAD


  resources :users do
    collection {post :import}
  end

  resources :admins do
    collection {post :import}
  end
=======
  resources :profile, only: [:index, :show, :new, :create, :update]
>>>>>>> development

  resources :sports do
    collection {post :import}
  end

  resources :home, only: [:index, :show] do
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
