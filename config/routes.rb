Rails.application.routes.draw do
	devise_for :users
	root 'prototypes#index'
	resources :prototypes, except: [ :update, :edit, :delete ]
	resources :users, except: [:index, :new, :create]
end
