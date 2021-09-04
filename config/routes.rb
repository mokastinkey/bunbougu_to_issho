Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :post_bungus

end
