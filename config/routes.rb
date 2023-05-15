Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  put "/accept_appointment/:id", to: "appointments#accept_appointment", as: :accept_appointment
  put "/reject_appointment/:id", to: "appointments#reject_appointment", as: :reject_appointment

  resources :handymen do
    resources :skills, only: %i[new create]
    resources :appointments, only: %i[new create]
    resources :chatrooms, only: %i[create]
  end

  resources :appointments, only: %i[show] do
    resources :reviews, only: %i[new create]
  end

  resources :skills, only: %i[edit update destroy]

  resources :chatrooms, only: %i[show index] do
    resources :messages, only: :create
    # cuando cree mensajes, quiero que esten asociados a algun chatroom
  end

  get "/my_profile", to: "pages#my_profile", as: :my_profile
end
