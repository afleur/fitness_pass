Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :courses, only: [:show]
  resources :sessions, only: [:show, :index] do
    resources :bookings, only: [:show, :index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
