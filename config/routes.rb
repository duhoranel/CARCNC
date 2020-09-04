Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars, only: [ :index, :new, :create, :show ]do
    resources :bookings, only: [:new, :create] do
      get "/confirmation", to: "bookings#confirmation"
    end
  end

  patch '/bookings/:id', to:'bookings#update'

  get '/bookings/dashboard', to: 'bookings#dashboard'
  patch "/accept", to: "bookings#accept", as: "accept"
  patch "/reject", to: "bookings#reject", as: "reject"

  get '/navbar', to: 'pages#navbar'
  get '/calendar', to: 'pages#calendar'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

