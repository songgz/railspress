Railspress::Application.routes.draw do

  root 'posts#index'

  resources :users

  match '/signup',      to: 'users#new',             via: 'get'
  
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',      to: 'sessions#new',          via: 'get'
  match '/signout',     to: 'sessions#destroy',      via: 'get'

  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :posts
  resources :categories

  match '/search',      to: 'searches#posts',        via: 'get'

  resources :images, only: [:create] do
    member do
      get :get_existing
    end
  end

  get 'tags/:tag',      to: 'posts#index',           as: :tag

 # Redirect for google
 # Need to be above get '/:id'
  get 'sitemap', to: redirect(RP_SITEMAP_URL)

  # Customize for Workabroad
  get 'tech/:id',       to: 'posts#show',            as: :tech
  get 'lifeabroad/:id', to: 'posts#show',            as: :lifeabroad
  get 'workabroad/:id', to: 'posts#show',            as: :workabroad
  get '/:id',           to: 'posts#show',            as: :page

  # Latest posts in the category
  get 'category/:id',   to: 'categories#show_in_category', as: :category_in

 

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
