Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks' 
      }
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
