Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  #indexPageButtonToForms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Temporary get for test
  get 'static/index'
end
