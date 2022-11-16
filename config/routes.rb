Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:create, :index, :show, :update, :destroy]
  resources :projects, only: [:create, :index, :show, :update, :destroy]
end
