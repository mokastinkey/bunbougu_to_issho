Rails.application.routes.draw do

  get 'finders/finder'
  get 'genres/show'
  root to: 'post_bungus#index'
  get 'homes/about'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]

  post 'follow/:id', to: 'relationships#follow', as: 'follow'
  delete 'unfollow/:id', to: 'relationships#unfollow', as: 'unfollow'
  get 'users/following/:id', to: 'users#following', as:'users_following'
  get 'users/follower/:id', to: 'users#follower', as:'users_follower'

  resources :post_bungus do
    resources :post_comments, only: [:create, :destroy]
  end

  #ジャンル検索
  resources :genres, only: [:show]
  #キーワード検索
  get 'finder' => "finders#finder"
  post 'finder' => "finders#finder"

  get 'search', to: 'post_bungus#search'

  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

end
