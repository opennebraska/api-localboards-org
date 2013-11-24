OrgOrg::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  match '/states/:id/boards/', :controller => 'boards', :action => 'options', :constraints => {:method => 'OPTIONS'}
  match '/states/', :controller => 'states', :action => 'options', :constraints => {:method => 'OPTIONS'}
  match '/states/:id/cities/:id/boards', :controller => 'boards', :action => 'options', :constraints => {:method => 'OPTIONS'}  
  match '/states/:id/counties/:id/boards', :controller => 'boards', :action => 'options', :constraints => {:method => 'OPTIONS'}
  
  match '/states/:id/boards/:id', :controller => 'boards', :action => 'options', :constraints => {:method => 'OPTIONS'}
  match '/states/:id', :controller => 'cities', :action => 'options', :constraints => {:method => 'OPTIONS'}
  match '/states/:id/cities/:id/boards/:id', :controller => 'boards', :action => 'options', :constraints => {:method => 'OPTIONS'}  
  match '/states/:id/counties/:id/boards/:id', :controller => 'boards', :action => 'options', :constraints => {:method => 'OPTIONS'}

  match '/states/:id/boards/:id/seats', :controller => 'board_seats', action: 'options', constraints: {method: 'OPTIONS'}
  match '/states/:id/counties/:id/boards/:id/seats', :controller => 'board_seats', action: 'options', constraints: {method: 'OPTIONS'}
  match '/states/:id/cities/:id/boards/:id/seats', :controller => 'board_seats', action: 'options', constraints: {method: 'OPTIONS'}

  match '/states/:id/boards/:id/members', :controller => 'members', :action => 'options', :constraints => {:method => 'OPTIONS'}
  match '/states/:id/members/:id', :controller => 'members', :action => 'options', :constraints => {:method => 'OPTIONS'}
  match '/states/:id/counties/:id/members/:id', :controller => 'members', :action => 'options', :constraints => {:method => 'OPTIONS'}
  match '/states/:id/cities/:id/members/:id', :controller => 'members', :action => 'options', :constraints => {:method => 'OPTIONS'}
  match '/states/:id/', :controller => 'counties', :action => 'options', :constraints => {:method => 'OPTIONS'}
  match '/states/:id/cities/:id/boards/:id/members', :controller => 'members', :action => 'options', :constraints => {:method => 'OPTIONS'}  
  match '/states/:id/counties/:id/boards/:id/members', :controller => 'members', :action => 'options', :constraints => {:method => 'OPTIONS'}

  match '/states/:id/boards/:id/seats', :controller => 'board_seats', :action => 'options', :constraints => {:method => 'OPTIONS'}
  match '/states/:id/cities/:id/boards/:id/seats', :controller => 'board_seats', :action => 'options', :constraints => {:method => 'OPTIONS'}  
  match '/states/:id/counties/:id/boards/:id/seats', :controller => 'board_seats', :action => 'options', :constraints => {:method => 'OPTIONS'}

  get '/states/:state_id/boards/:board_id/seats', to: 'board_seats#index'
  match '/states/:state_id/cities/:city_id/boards/:board_id/seats', :controller => 'board_seats', :action => 'index'
  match '/states/:state_id/counties/:county_id/boards/:board_id/seats', :controller => 'board_seats', :action => 'index'

  post '/states/:state_id/boards/:board_id/seats', to: 'board_seats#create'
  match '/states/:state_id/boards/:board_id/seats/:id', :controller => 'board_seats', :action => 'show'
  match '/states/:state_id/cities/:city_id/boards/:board_id/seats/:id', :controller => 'board_seats', :action => 'show'
  match '/states/:state_id/counties/:county_id/boards/:board_id/seats/:id', :controller => 'board_seats', :action => 'show'

  match '/states/:id/departments', controller: 'departments', action: 'options'
  match '/states/:id/counties/:id/departments', controller: 'departments', action: 'options'
  match '/states/:id/cities/:id/departments', controller: 'departments', action: 'options'

  resources :states do
    collection do

    end
    resources :counties do

      resources :boards do
        resources :members
        resources :board_seats, path: 'seats'
      end
      resources :members
      resources :departments
    end

    resources :boards do
      resources :members
      resources :board_seats, path: 'seats'
    end

    resources :cities do
      resources :boards do
        resources :members
        resources :board_seats, path: 'seats'
      end
      resources :members
      resources :departments
    end
    resources :members
    resources :departments
  end

  resources :departments

  # resources :specs, path: 'docs'
  # resources :docs, path: 'specs'



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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
