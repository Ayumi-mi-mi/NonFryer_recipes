Rails.application.routes.draw do
  get "oauths/oauth"
  get "oauths/callback"
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "tops#index"

  resources :users, only: %i[new create destroy]
  resources :recipes, only: %i[new show create edit update destroy] do
    member do
      patch :status_change
      delete :remove_main_image
    end
  end
  resources :my_recipes, only: %i[index]
  resource :profile, only: %i[edit update]
  resources :bookmarks, only: %i[index create destroy]
  resources :contacts, only: %i[new create]
  resources :password_resets, only: %i[ new create edit update ]
  resources :activations, only: %i[new edit update]

  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  get "autocomplete/tops", to: "tops#autocomplete"
  get "autocomplete/my_recipes", to: "my_recipes#autocomplete"
  get "autocomplete/bookmarks", to: "bookmarks#autocomplete"

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
