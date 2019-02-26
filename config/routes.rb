Rails.application.routes.draw do

  get 'courses/index'
  get 'courses/show'
  get 'courses/create'
  get 'courses/destroy'
  get 'courses/edit'
  get 'courses/update'
  get 'courses/new'
  devise_for :users
  root to: 'pages#home'
  resources :sessions, only: [:show, :index] do
    resources :bookings, only: [:show, :index, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
