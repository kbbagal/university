Rails.application.routes.draw do
  get 'login', to: 'login#new'
  post 'login_create', to: 'login#create'
  delete 'logout', to:'login#destroy'
  root 'courses#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about', to: 'pages#about'
  resources :students
  post 'course_enroll', to: 'student_courses#create'
end