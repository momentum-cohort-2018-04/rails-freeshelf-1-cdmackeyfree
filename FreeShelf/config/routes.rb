Rails.application.routes.draw do
  root 'books#index'
  resources :books

  resources :authors

  resources :users

  resources :checkouts

  resource :login
  get 'login', to: 'logins#new'
  get 'logout', to: 'logins#destroy', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
