Rails.application.routes.draw do
  get 'sports/import'
  devise_for :users

  root to: 'home#index'

resources :sports do
  collection {post :import}
end

resources :home, only: [:index] do
  collection {get :import}
end

resources :sport_roles, only: [:index] do
  collection {post :import}
end

end
