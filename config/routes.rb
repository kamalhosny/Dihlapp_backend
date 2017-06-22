Rails.application.routes.draw do
  # root 'conversations#index'
  resources :users

  resources :conversations, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, only: [:new, :create, :index, :show]
  resources :sessions, only: [:create]
  delete "sessions" => "sessions#destroy"
end
