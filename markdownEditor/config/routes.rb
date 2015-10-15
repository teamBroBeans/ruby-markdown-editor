Rails.application.routes.draw do

  #resources :users
  #devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  
  
  get 'trashcan' => "trashcan#index"
  get 'trashcan/create/:id' => "trashcan#create", :as => :trashcan_create
  get 'trashcan/delete/:id' => "trashcan#delete", :as => :trashcan_delete
  get 'trashcan/undo/:id' => "trashcan#undo", :as => :trashcan_undo
  get 'trashcan/deleteall' => 'trashcan#deleteall'
  
  get "/shared_notes/:slug" => "shared_notes#show"
  
  get "/home/textEditor"

  resources :notes do
      member do
          put :share
      end
  end
  
  resources :notes do
      member do
          put 'unshare'
      end
  end
  
  devise_for :users, :skip => [:sessions, :registrations]
  devise_scope :user do
    get    "sign-in",  to: "devise/sessions#new",         as: :new_user_session
    post   "sign-in",  to: "devise/sessions#create",      as: :user_session
    delete "sign-out", to: "devise/sessions#destroy",     as: :destroy_user_session
 
    get    "sign-up",  to: "devise/registrations#new",    as: :new_user_registration
    post   "sign-up",  to: "devise/registrations#create", as: :user_registration
  end
    
  root controller: 'notes', action: 'index'
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
end
