Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"
  resources :users, only: [:edit, :update]
  resources :plans, only: [:new, :create, :show, :destroy] do
    resources :contents, only: [:index, :create]
  end
end
