Rails.application.routes.draw do
  devise_for :users
  get 'contents/index'
  root to: "plans#index"
  resources :users, only: [:edit, :update]
  resources :plans, only: [:new, :create, :show]
end
