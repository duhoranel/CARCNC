Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :cars, only: [ :index, :new, :create, :show ]do
    resources :bookings, only: [:new, :create]
  end

  patch '/bookings/:id', to:'bookings#update'
  get '/bookings/owner', to: 'bookings#index_owner'
  get '/bookings/renter', to: 'bookings#index_renter'
  get '/navbar', to: 'pages#navbar'

  put "/booking_accepted/:id", to: "bookings#mark_as_accepted", as: :accepted
  put "/booking_rejected/:id", to: "bookings#mark_as_rejected", as: :rejected
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# coucou
