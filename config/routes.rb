Rails.application.routes.draw do
  root "sessions#login"
  resources :expenses
  resources :users
  resources :budgets

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
end
