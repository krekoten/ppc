Ppc::Application.routes.draw do
  devise_for :admins, :controllers => { :sessions => "admins/sessions" }
  
  resources :news
  resources :press_releases
  resources :important_events
  resources :sacred_objects
  resources :tours
  
  namespace :admins do
    resources :admins
    resources :news
    resources :sacred_objects
    resources :sessions
    resources :tours
    
    root :to => "news#index"
  end
  
  root :to => "welcome#index"
end
