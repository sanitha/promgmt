Promgmt::Application.routes.draw do 
 
  resources :user do
    collection do
      get 'login'
      get 'selection'
      post 'new_user_reg'      
      get 'admin'
      get 'logout'
      get 'employee'      
      get 'pass_reset'
    end
  end

  resources :client do
    collection do     
      get 'user_home'
      post 'proj_enquiry'
      post 'view_status'
    end
  end

  resources :admin do
    collection do
        get 'admin_home'
        post 'enquired_proj'
        post 'user_needs'
        post 'runnning_proj'
        post 'block_user'
        post 'proj_status'
        post 'team_creation'
        post 'add_employee'
        post 'enq_proj_details'
        post 'team_details'
        post 'assign_proj'
        get 'autocomplete_client_proj_name'
    end
  end

 
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "user#login"
  Promgmt::Application.routes.draw do
 root :to => "user#login"
  end
 match '/edit_account', :to =>"user#new_user_reg"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
