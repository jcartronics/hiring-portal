Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, only: [:new, :create]

  get 'home/index'
  get 'home/jobs'
  root "home#index"
end
