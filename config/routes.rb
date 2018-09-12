Rails.application.routes.draw do
  root "welcome#index"
  get '/validate', to: 'validate#index'
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show]
    end
  end
end
