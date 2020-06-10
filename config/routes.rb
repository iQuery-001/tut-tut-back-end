Rails.application.routes.draw do
  # resources :comments
  # resources :articles
  # resources :comment_pops
  # resources :article_pops
  # resources :specialities
  resources :users, only: [:index, :show]
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :articles
  resources :comments
  delete :logout, to: "sessions#log_out"
  get :logged_in, to: "sessions#logged_in"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
