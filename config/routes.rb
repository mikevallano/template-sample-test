Rails.application.routes.draw do
  root "home#index"

  namespace :admin do
    get 'index'
  end

  namespace :api do
    get 'index'
  end

  devise_for :users
end
