Rails.application.routes.draw do
  resources :conversations, only: [:index, :show]
  resources :messages, only: [:create]
  root 'conversations#index'
end
