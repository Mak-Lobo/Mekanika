Rails.application.routes.draw do
  get "sign_ups/show"

  # namespace for settings
  namespace :settings do
    resource :email, only: [ :show, :update ]
    resource :password, only: [ :show, :update ]
    resource :profile, only: [ :show, :update, :destroy ]

    root to: redirect("/settings/profile")
  end

  namespace :email do
    resources :confirmations, param: :token, only: [ :show ]
  end

  resource :session
  resources :passwords, param: :token
  resources :services
  resources :sign_ups, only: :create
  # get "services/show"
  # get "services/", to: "services#index", as: "services"
  # get "services/create"
  # get "services/new", to: "services#new", as: "new_service"
  # get "services/delete"
  # get "services/update"
  # get "services/edit"

  # get "service/:id/edit", to: "services#edit", as: "edit_service"
  # get "service/:id", to: "services#show", as: "service"

  # patch "service/:id", to: "services#update"
  # delete "service/:id", to: "services#delete", as: "delete_service"

  # post "services", to: "services#create"

  get "signup", to: "sign_ups#new", as: :signup
  get "home", to: "pages#home"
  get "about", to: "pages#about"

  # root of the application
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
