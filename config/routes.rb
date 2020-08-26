Rails.application.routes.draw do
  devise_for :users
  root to: 'cars#index'
  resources :cars, only: [ :index, :new, :create, :show ]do
    resources :bookings, only: [:new, :create]
  end

  patch '/bookings/:id', to:'bookings#update'
  get '/bookings/owner', to: 'bookings#index_owner'
  get '/bookings/renter', to: 'bookings#index_renter'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
