Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :users do
    resources :photos
  end

  resources :albums

  resources :photos do
    resources :comments
  end

end
