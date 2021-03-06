Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_error'

  get 'errors/unacceptable'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
root "pages#home"
get "aboutus", to: "pages#about"
get 'term', to: "pages#term"
get 'price_explanation', to: "pages#price"
get 'faq', to: "pages#faq"


resources :images  , :path => 'crownshot'

resources :users, except: [:new]
get "become_a_stylist", to: "users#become_a_stylist"
get "signup", to: "users#new"
get "add_to_wishlist", to: "users#add_to_wishlist"
post "add_to_wishlist", to: "users#add_to_wishlist"
get "stylist_detail", to:"users#stylist_detail"
get "locationmap", to: "users#locationmap"


delete "imageuser", to: "imageusers#destroy"

resources :categories
get "login", to: "sessions#new"
post "login", to: "sessions#create"
delete "logout", to: "sessions#destroy"

resources :menus

resources :wishlists

resources :password_resets

match "/404", :to => "errors#not_found", :via=> :all
match "/422", :to => "errors#unacceptable", :via=> :all
match "/500", :to => "errors#internal_error", :via=> :all

match '/contacts',     to: 'contacts#new',             via: 'get'
resources "contacts", only: [:new, :create]


resources :multiples

resources :profiles, only: [:show, :index]


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
