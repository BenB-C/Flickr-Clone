Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :users do
    resources :albums
  end

  resources :albums do
    resources :photos
  end

  resources :photos do
    resources :comments
  end

end
