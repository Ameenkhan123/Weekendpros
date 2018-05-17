Rails.application.routes.draw do
  root 'home#index'
  resources :home
  resources :skills
  devise_for :users, controllers: {
    sessions: 'users/registrations',
    sessions: 'users/sessions'
    # sessions: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    delete "/sign_out", :to => 'sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
