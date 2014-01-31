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
  match '/states/:state_id/counties/:county_id/boards/:board_id/seats', :controller => 'board_seats', :action => 'index'

  post '/states/:state_id/boards/:board_id/seats', to: 'board_seats#create'
  post '/states/:state_id/cities/:city_id/boards/:board_id/seats', :controller => 'board_seats', :action => 'create'
  match '/states/:state_id/cities/:city_id/boards/:board_id/seats', :controller => 'board_seats', :action => 'index'
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

 
end
