Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :employees
  end

  root to: 'users#index'
  resources :users
  resources :contents
  resources :ctalogs

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
