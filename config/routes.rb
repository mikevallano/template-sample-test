Rails.application.routes.draw do

  resources :events
  post "results", :to => "movies#create"
  get "results", to: "static_pages#results"

  get "zorro", to: "static_pages#nada"
  root "static_pages#index"
  get "tuup", to: "static_pages#furry"
  get "flick", to: "static_pages#flick"
  post "omega", to: "static_pages#omega"
  get "paramtest", to: "static_pages#paramtest"
  get "dbugga", to: "static_pages#dbugga"
  get "javatester", to: "static_pages#javatester"
  get "kittyresults", to: "static_pages#kittyresults"
  get "jaxattack", to: "static_pages#jaxattack"

  resources :kittens
  resources :movies


  namespace :admin do
    get 'index'
    resources :posts
    resources :thingies
    resources :loners
  end

  namespace :api do
    get 'index'
  end

  # devise_for :users
  get "users", :to => "users#index"
  get "users/new", :to => "users#new"
  post "users/", :to => "users#create"
  get "users/:id", :to => "users#show", :as => :user
  get "users/:id/edit", :to => "users#edit", :as => :edit_user
  put "users/:id", :to => "users#update"
  patch "users/:id", :to => "users#update"
  delete "users/:id", :to => "users#destroy"

end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
