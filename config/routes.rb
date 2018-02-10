Rails.application.routes.draw do
  get 'home/index'

  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts

  root 'home#index'
end
