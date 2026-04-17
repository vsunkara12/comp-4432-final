Rails.application.routes.draw do
  get 'flawed/show_grade'
  get 'flawed/admin'
  get 'flawed/students_edit'
  get 'flawed/students_update'
  get 'admin/index'
  get 'grades/index'
  get 'grades/show'
  get 'courses/index'
  get 'courses/show'
  get 'students/new'
  get 'students/create'
  get 'students/show'
  get 'students/edit'
  get 'students/update'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
