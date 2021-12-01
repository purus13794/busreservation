Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  root 'bookings#home'
  get "signup",to:"users#new"
  resources :users,except: [:new]
  resources :bookings
  get 'login',to: 'session#new'
  post 'login',to: 'session#create'
  delete 'logout',to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end