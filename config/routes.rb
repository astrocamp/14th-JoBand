# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :profiles, except: [:destroy]
  # Defines the root path route ("/")
  root 'pages#index'

  resources :pages, only: [:index]

  resources :bands, except: [:destroy]
end
