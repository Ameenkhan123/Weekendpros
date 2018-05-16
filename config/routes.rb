Rails.application.routes.draw do
  root 'home#index'
  resources :home
  devise_for :users
  resources :skills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
