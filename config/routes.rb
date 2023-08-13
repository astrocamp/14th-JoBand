Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    passwords: "users/passwords",
<<<<<<< HEAD
    omniauth_callbacks: "users/omniauth_callbacks",
    confirmations: "users/confirmations"
=======
    omniauth_callbacks: "users/omniauth_callbacks"
>>>>>>> f5a2218 (新增Google & Facebook 第三方登入 feat: add OAuth -login (#9))
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  resources :pages, only: [:index]


  resources :bands , except: [ :destroy ]
end
