Rails.application.routes.draw do

  root "static_pages#index"

  namespace :clientmod do
    resources :static_pages, only: [:index]
  end

end
