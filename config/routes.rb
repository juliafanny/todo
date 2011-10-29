Todo::Application.routes.draw do

  get "tasks/new"
  get "project_memberships/create"
  get "project_memberships/accept_join"

  root :to => "sessions#new"
  
  get "sign_up" => "users#new", :as => "sign_up"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  #delete "log_out" => "sessions#destroy", :as => "log_out"
  resources :sessions, :only => [:new, :create, :destroy]

  resources :project_memberships

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
    resources :comments, :only => [:index, :show]
  end

  resources :comments

  #match '/auth/:provider/callback', :to => 'sessions#callback'

end