Rails.application.routes.draw do
  devise_for :users

  resources :contacts

  post 'layout' => "contacts#layout"

  root 'contacts#index'
end
