Rails.application.routes.draw do

  get 'developer/new'

  get 'sessions/new'

  resources :developers
  resources :users
  resources :static_pages
  resources :apps
  resources :microposts,	only: [:new, :create, :edit, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   #root :to  => redirect('/home')
   
   root             'static_pages#home'
   #get 'help'    => 'static_pages#help'
   #get 'about'   => 'static_pages#about'
   #get 'contact' => 'static_pages#contact'
   get  'spinin'  => 'static_pages#spinin'
   get  'signup'  => 'static_pages#spinup'
   get 'signup/user'  => 'users#new'
   get 'signup/developer'  => 'developers#new'
   get    'login'   => 'sessions#new'
   post   'login'   => 'sessions#create'
   get    'logindev'   => 'sessions#newdev'
   post   'logindev'   => 'sessions#createdev'
   get 'logout'  => 'sessions#destroy'
   get 'logoutdev'  => 'sessions#destroydev'

   
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
