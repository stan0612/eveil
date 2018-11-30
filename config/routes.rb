Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users
  resources :products, only: [:show, :new, :create]
  resources :orders, only: [:index, :create] do
    member do
      get 'pay', to: 'orders#pay'
    end
  end
