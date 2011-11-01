Todo::Application.routes.draw do
  root :to => "sessions#new"

  get "project_memberships/create"
  get "project_memberships/accept_join"
  #delete "users/destroy"
  
  get "sign_up" => "users#new", :as => "sign_up"
  get "log_in" => "sessions#new", :as => "log_in"
  delete "log_out" => "sessions#destroy", :as => "log_out"

  root :to => "sessions#new"
 
  resources :sessions, :only => [:new, :create, :destroy]

	resources :projects do
    resources :users
    resources :tasks
    resources :project_memberships
  end

  resources :tasks do
    resources :projects
    resources :comments, :only => [:create]
  end

  resources :users do
    resources :projects
    resources :comments
  end


  #match '/auth/:provider/callback', :to => 'sessions#callback'

end