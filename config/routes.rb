Rails.application.routes.draw do
  root 'home#index'
  get '/auths' => 'auths#index'
  # get '/profile' => 'auths#show'
  get '/profile' => 'auths#profile'
  get '/home' => 'home#index'
  resources :home
  resources :auths
  resources :skills
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks:  "users/omniauth_callbacks" 
  }

  # devise_scope :user do
  #   delete "/sign_out", :to => 'sessions#destroy'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
