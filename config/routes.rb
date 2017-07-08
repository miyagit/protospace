Rails.application.routes.draw do
	devise_for :users
	root 'prototypes#index'

	resources :prototypes, only: %w(index new edit show create update)
	resources :users, only: %w(show edit update, delete)

end

