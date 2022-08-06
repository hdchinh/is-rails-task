require "sidekiq/web"

Rails
  .application
  .routes
  .draw do
    mount Sidekiq::Web => "/sidekiq"
    namespace :api do
      post "login", to: "sessions#create"
      post "signup", to: "users#create"

      resources :queue_jobs, only: %i[index create]
    end
  end
