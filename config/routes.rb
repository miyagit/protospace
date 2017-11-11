Rails.application.routes.draw do
	devise_for :users
	root 'prototypes#index'


	resources :users, only: %w(show edit update, delete)

	resources :prototypes

  scope module: :prototypes do
    resources :likes, only: %w(create, destroy)
  end

end

