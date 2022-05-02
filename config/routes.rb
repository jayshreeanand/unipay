Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  get 'pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'qr-scan', to: 'basic_qr_codes#index'

  root to: 'pages#home'
end
