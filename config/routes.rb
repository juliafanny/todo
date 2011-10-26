Todo::Application.routes.draw do
  root :to => "sessions#new"
  
  get "sign_up" => "users#new", :as => "sign_up"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  #delete "log_out" => "sessions#destroy", :as => "log_out"
  resources :sessions, :only => [:new, :create, :destroy]

	resources :projects do
    resources :users
  end

  resources :users do
    resources :projects
    #resources :comments, :only => [:index, :show]
  end

  resources :comments

  #match '/auth/:provider/callback', :to => 'sessions#callback'

end