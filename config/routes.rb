Rails.application.routes.draw do
  
  # devise 方法
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords" }

  root "home#index" #先暫定
end
