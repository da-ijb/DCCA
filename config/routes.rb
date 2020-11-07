Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end  
  resources :users, only: :show 
  resources :messages, only: :create
  resources :rooms, only: [:create, :show, :index]
end
