Rails.application.routes.draw do
	resources :prototypes, only: [:index, :show, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
