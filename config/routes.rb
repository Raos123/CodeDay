TimeKeepingSystem::Application.routes.draw do
  root to: 'sessions#new'

  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/signup', to: 'users#new'
   
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update]
end
