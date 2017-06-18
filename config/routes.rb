Rails.application.routes.draw do
  
  resources :conversations, only: [:index, :show]
  # root 'conversations#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, only: [:new, :create]
end
