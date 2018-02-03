Rails.application.routes.draw do
	devise_for :users
	root 'prototypes#index'


	resources :users, only: %w(show edit update delete)

	resources :prototypes
	resources :tags, only: [:index, :show]

  scope module: :prototypes do
    resources :likes, only: %w(create destroy)
    resources :comments, only: [:create]
    resources :newest, only: [:index]
  end

end

