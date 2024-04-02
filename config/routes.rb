Rails.application.routes.draw do
  # Generated routes for models
  resources :chores
  resources :tasks
  resources :children
  
  # Setting default route
  root to: 'chores#index'

  # API routing
  scope module: 'api', defaults: {format: 'json'} do
    namespace :v1 do
      # API routes go here
       
    end
  end
    
  
end
