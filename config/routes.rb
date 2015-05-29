Rails.application.routes.draw do
  root "static_pages#index"

  resources :kittens
  resources :posts


  namespace :admin do
    get 'index'
  end

  namespace :api do
    get 'index'
    get "users/:id", :to => "users#show"
    post "authenticate", :to => "users#authenticate"
    post "users", :to => "users#create"
    patch "users", :to => "users#save"
    post "device", :to => "users#device"
  end

end
