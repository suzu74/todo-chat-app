Rails.application.routes.draw do
  root to: "home#index" 
  devise_for :users
  resources :boards
  resource :profile, only: [:show, :edit, :update]
end
