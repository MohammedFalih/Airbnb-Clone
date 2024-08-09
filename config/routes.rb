Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "home#index"

  namespace :api do
    resources :wishlists, only: [ :create, :destroy ]
  end

  resources :properties, only: [ :show ] do
    resources :bookings, only: [ :new ]
  end

  resources :booking_payments, only: [ :create ]

  resources :wishlists, only: [ :index ]

  resource :profile, only: [ :edit, :update ]
  resource :email, only: [ :edit, :update ]
  resource :password, only: [ :edit, :update ]

  resources :reservations, only: [ :index ] do
    resources :reviews, only: [ :new, :create ]
  end

  get "booking_payments/success", to: "booking_payments#success"
end
