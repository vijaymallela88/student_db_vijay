Rails.application.routes.draw do
	
  get 'students/pending_students' => 'students#pending_students'
  get 'students/approve_student' => 'students#approve_student'
  resources :students
  resources :institutions
  root :to => 'home#index'
  devise_for :users, controllers: { registrations: "registrations"}

end
