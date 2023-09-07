# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations'
  }

  resources :profiles, except: [:destroy] do
    collection do
      get :welcome
      get :letsjam
    end
  end

  get 'activities/activity_index'

  resources :bands, param: :slug, except: [:destroy] do
    resources :band_members, except: %i[new show index]
    resources :recruits, shallow: true do
      resources :resume_lists, except: %i[destroy index] do
        member do
          patch :reject
          post :approve
        end
        
        resources :comments, only: %i[create destroy], shallow: true
      end
    end
    resources :activities, shallow: true
  end


  scope "communities" do
    resources :posts, only: %i[index create show destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :posts, only: [] do
        member do
          patch :like
        end
      end
    end
  end
end