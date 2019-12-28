Rails.application.routes.draw do
  devise_for :users
  root "static_pages#index"

  resource :dashboard, only: [:show]

  namespace :clientmod do
    resources :static_pages, only: [:index]
    resources :clients
  end

  namespace :usermod do
    resources :static_pages, only: [:index]
    resources :users
  end

  namespace :infosheets do
    resources :static_pages, only: [:index]
  end

  namespace :infosheetmod do
    resources :static_pages, only: [:index]
  end
end
