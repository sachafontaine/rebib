Rails.application.routes.draw do
  root to: 'pages#home'

  resources :races do
    resources :bibs, only: [:new, :create]
  end

  resources :bibs, only: [:delete, :index, :update, :edit]

  devise_for :users
  resources :users, only: [:index]

  resources :conversations do
    resources :messages
  end

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
