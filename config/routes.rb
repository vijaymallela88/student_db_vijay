Rails.application.routes.draw do
	
  resources :students
  resources :institutions
  root :to => 'home#index'
  devise_for :users, controllers: { registrations: "registrations"}

end
