Rails.application.routes.draw do
  resources :transactions
  resources :contacts
  get 'dashboard', to: 'dashboard#index'
  
  post 'create_payid', to: 'dashboard#create_payid'
  post 'create_request', to: 'dashboard#create_request'

  devise_for :users
  get 'pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'qr-scan', to: 'basic_qr_codes#index'
  get 'search', to: 'users#search'
  get 'requests', to: 'users#requests'
  get 'invoice', to: 'users#invoice'

  root to: 'pages#home'
  get 'home', to: 'pages#home'

  get 'profile', to: 'users#me'
end
