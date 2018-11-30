Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users
  resources :products, only: [:index, :show, :new, :create]
  resources :orders, only: [:index, :create] do
    member do
      get 'pay', to: 'orders#pay'
    end
  end
  get 'add_reviews', to: 'reviews#add_reviews'
end
