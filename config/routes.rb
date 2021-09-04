Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]

  post 'follow/:id', to: 'relationships#follow', as: 'follow'
  delete 'unfollow/:id', to: 'relationships#unfollow', as: 'unfollow'
  get 'users/following/:user_id', to: 'users#following', as:'users_following'
  get 'users/follower/:user_id', to: 'users#follower', as:'users_follower'

  resources :post_bungus

end
