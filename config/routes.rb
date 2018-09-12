Rails.application.routes.draw do
  root "welcome#index"
  get '/validate', to: 'validate#index'
end
