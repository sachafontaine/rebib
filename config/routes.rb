Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :races
  resources :bibs
  get 'dashboard', to: 'pages#dashboard'
  get 'calcul_allure', to: 'pages#calcul_allure'
end
