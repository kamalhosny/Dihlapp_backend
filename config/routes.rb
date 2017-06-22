Rails.application.routes.draw do
  # root 'conversations#index'

  mount ActionCable.server => '/cable'

  resources :users

  resources :conversations, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, only: [:create]
  resources :sessions, only: [:create]
  delete "sessions" => "sessions#destroy"
end
