TimeKeepingSystem::Application.routes.draw do
  get "companies/new"

  get "companies/create"

  get "company/new"

  get "company/create"

  root to: 'sessions#new'

  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/signup', to: 'users#new'
   
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update]
  resources :companies, only: [:new, :create]
  resources :projects, only: [:new, :create]
end
