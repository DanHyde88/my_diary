Rails.application.routes.draw do

  root to: 'users#new'
  resources :users, only: [:new, :create, :show]

  resources :user_sessions, only: [:new, :create, :destroy ]

  resources :events, only: [:index, :new, :create]

  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end