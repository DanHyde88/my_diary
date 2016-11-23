Rails.application.routes.draw do

  get 'static_pages/home'

  #get 'invites/create' => 'invites#create'

  root to: 'static_pages#home'
  resources :users, only: [:new, :create, :show]

  resources :user_sessions, only: [:new, :create, :destroy ]

  resources :events, only: [:index, :new, :create, :show]

  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'

  post 'invites/create' => 'invites#create'
  post 'invites/destroy' => 'invites#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end