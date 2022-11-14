Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show, :update, :destroy]
  resources :projects, only: [:create, :index, :show, :update, :destroy]
end
