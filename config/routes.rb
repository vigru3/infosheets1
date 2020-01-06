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

    resources :clients, only: [:index, :show] do |clients|
      resources :sections, only: [:index]
    end

    resources :sections, only: [:show]  do |section|
        resources :infos, only: [:index]
    end

    resources :infos, only: [:show]
  end

  namespace :infosheetmod do
    resources :static_pages, only: [:index]

    resources :clients, only: [:index, :show] do |clients|
      resources :sections, only: [:index, :new, :create]
    end

    resources :sections, only: [:show, :edit, :update, :destroy]  do |section|
        resources :infos, only: [:index, :new, :create]
    end

    resources :infos, only: [:show, :edit, :update, :destroy]
  end
end
