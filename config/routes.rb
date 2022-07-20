Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :patients
  resources :doctors
  resources :appointments
  resources :categories
  resources :recommendations
  resources :avatar, only: [:create]
  resources :home
  root to: 'home#index'
  get '/patient/profile', to: "patients#profile"
  get '/doctor/profile', to: "doctors#profile"
  post '/appointment/rec', to: "appointments#set_recommendation"
end
