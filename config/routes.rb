Rails.application.routes.draw do
  root to: 'pages#home'

  resources :races
  resources :bibs

  devise_for :users

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  get 'dashboard', to: 'pages#dashboard'
  get 'ressources', to: 'pages#ressources'
  get 'calcul_allure', to: 'pages#calcul_allure'
  get 'programme', to: 'pages#programme'
  get 'alimentation', to: 'pages#alimentation'
  get 'shop', to: 'pages#shop'
end
