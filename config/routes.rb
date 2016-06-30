Rails.application.routes.draw do
  resources :bugs
  resources :invites
  post '/rate' => 'rater#create', :as => 'rate'

  resources :developers
  resources :users do
    member do
      get :following
    end
  end

  resources :static_pages
  resources :apps do
    resources :microposts
    member do
      get :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]


  resources :approvals
  resources :skills

  get 'skills/:id/show_htmlcss' => 'skills#show_htmlcss'
  get 'skills/:id/show_java' => 'skills#show_java'
  get 'skills/:id/show_javascript' => 'skills#show_javascript'
  get 'skills/:id/show_c' => 'skills#show_c'
  get 'skills/:id/show_c_plus_plus' => 'skills#show_c_plus_plus'
  get 'skills/:id/show_nodejs' => 'skills#show_nodejs'
  get 'skills/:id/show_database' => 'skills#show_database'
  get 'skills/:id/show_algorithms' => 'skills#show_algorithms'
  get 'skills/:id/show_android' => 'skills#show_android'
  get 'skills/:id/show_ios' => 'skills#show_ios'

  get 'skills/:id/edit_htmlcss' => 'skills#edit_htmlcss'
  get 'skills/:id/edit_java' => 'skills#edit_java'
  get 'skills/:id/edit_javascript' => 'skills#edit_javascript'
  get 'skills/:id/edit_c' => 'skills#edit_c'
  get 'skills/:id/edit_cplus' => 'skills#edit_cplus'
  get 'skills/:id/edit_nodejs' => 'skills#edit_nodejs'
  get 'skills/:id/edit_database' => 'skills#edit_database'
  get 'skills/:id/edit_algorithms' => 'skills#edit_algorithms'
  get 'skills/:id/edit_android' => 'skills#edit_android'
  get 'skills/:id/edit_ios' => 'skills#edit_ios'

  get 'skills/:id/search' => 'skills#search'
  get 'results' => 'skills#results'

  get 'home/search' => 'developers#search'
  get 'dev_results' => 'developers#dev_results'

  get 'apps/:id/create_invite' => 'invites#create_invite'
  get 'apps/:id/requests' => 'invites#requests'
  get 'apps/:id/requests/accept' => 'invites#accept'
  get 'apps/:id/requests/refuse' => 'invites#refuse'

  get 'developers/:id/choose_your_apps' => 'apps#choose_your_apps'

  get 'developers/:id/pending_invites' => 'invites#pending_invites'
  get 'developers/:id/pending_invites/accept_invite' => 'invites#accept_invite'
  get 'developers/:id/pending_invites/refuse_invite' => 'invites#refuse_invite'

  get 'apps/:id/show_app_bugs' => 'bugs#show_app_bugs'
  get 'apps/:id/submit_bug' => 'bugs#submit_bug'
  get 'apps/:id/show_app_bugs/solved_bug' => 'bugs#solved_bug'

  get 'developers/:id/my_apps' => 'apps#my_apps'

  get 'login_admin' => 'users#login_admin'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   #root :to  => redirect('/home')
   
   root             'static_pages#root'
   get 'home' => 'static_pages#home'
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
   get 'random' => 'apps#random'
   get 'musthave' => 'apps#musthave'
   get 'freshapps' => 'apps#fresh'
   get 'appoftheday' => 'apps#appoftheday'

   
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
