Rails.application.routes.draw do
  root to: "home#index" 
  devise_for :users
  resources :boards do
    resources :tasks
  end
  resource :profile, only: [:show, :edit, :update]
end
