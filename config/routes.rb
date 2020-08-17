Rails.application.routes.draw do
  resources :properties
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  post 'signup', to: 'users#create'

  resource :user, only: [:show,:create ,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
