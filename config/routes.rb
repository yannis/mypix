Rails.application.routes.draw do
  devise_for :users
  get 'signout', to: 'devise/sessions#destroy', as: 'signout'
  resources :users, only: [:show] do
    resources :pics, only: [:show, :new, :edit, :create, :update]
  end
  resources :pics
  root to: "home#index"
end
