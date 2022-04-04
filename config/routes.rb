Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bibs
  resources :races
  get 'dashboard', to: 'pages#dashboard'
end
