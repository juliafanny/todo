Todo::Application.routes.draw do
  resources :users

  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "users#new"

  get "sign_up" => "users#new", :as => "sign_up"
  get "log_in" => "sessions#new", :as => "log_in"
  delete "log_out" => "sessions#destroy", :as => "log_out"
  resources :sessions, :only => [:new, :create, :destroy]

  match '/auth/:provider/callback', :to => 'sessions#callback'

end