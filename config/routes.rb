Rails
  .application
  .routes
  .draw do
    namespace :api do
      resources :queue_jobs, only: %i[index create]
    end
  end
