Rails.application.routes.draw do
	devise_for :users
	root 'prototypes#index'
	resources :prototypes, only: %w(show new create)
	resources :users, only: %w(show edit update)
end

