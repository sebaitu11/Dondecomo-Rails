Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :owners, :controllers => { :registrations => "owners"}

  devise_scope :owner do
    authenticated :owner do
      root :to => 'restos#show', as: :authenticated_root
    end
  end

  root to: 'home#index'

  
  resources :restos do
    member do 
      get :data
      post :publish_resto
      post :unpublish_resto
    end
    collection do
      get :get_restos
    end
    resources :menus
    resources :promos
    resources :configurations
  end

  get "api/restos/:id" => "restos_api#show_resto"

  get "api/resto/:id/"  => "restos#show_resto"

  get "api/resto/:id/menus" => "restos_api#menus"

  get "api/resto/:id/promos" => "restos_api#promos"

  post "api/search/:data" => "restos_api#search"

end