Herum::Application.routes.draw do
   get "access/menu"
  get "access/login"
  post "access/attempt_login"
  get "access/logout"
  resources :access
  match 'admin', :to => 'access#menu', via: [:get, :post]
  devise_for :users, controllers: {registrations: "users/registrations"}
 # devise_for :admins, :controllers => { :sessions => "admins/sessions" }
  root :to => "public#index"
 # get "access/menu"
 # get "access/login"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # get "subjects/list"
get 'assignments/view'
get 'assignment_edits/view'
get 'assignment_edits/download'
   #get "subjects/edit"
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  resources :students
  resources :subjects
  resources :admin_users
 # resources :assignments
  resources :uploads
    
  resources :public 
    resources :assignments do
      
      resources :assignment_edits do
           #get 'upload', on: :upload
      end
   end
  resources :assignment_edits
  resources :posts
  resources :teachers
  resources :users
  get "assignments/walla"  

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
