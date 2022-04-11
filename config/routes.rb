Rails.application.routes.draw do
  root to: 'pages#home'
  resources :races
  resources :bibs
  devise_for :users
  get 'dashboard', to: 'pages#dashboard'
  get 'calcul_allure', to: 'pages#calcul_allure'
  get 'ressources', to: 'pages#ressources'
end
