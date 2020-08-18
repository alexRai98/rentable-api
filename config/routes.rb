Rails.application.routes.draw do
  
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  post 'signup', to: 'users#create'

 resource :user, only: [:show,:create ,:update]
  resources :user, only: [:show, :create, :update] do
    resources :properties, only: [:show, :index, :create, :edit, :update]
  end

  resources :properties, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
