Rails.application.routes.draw do
  get 'pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'basic-qr-code-reader', to: 'basic_qr_codes#index'
  
  root to: 'pages#home'
end
