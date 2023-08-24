# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'

  resources :pages, only: [:index]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations'
  }
  resources :profiles, except: [:destroy] do
    member do
      get :welcome
      get :letsjam
    end
  end
  
  resources :bands, except: [:destroy] do
    resources :recruits, shallow: true
  end
end
