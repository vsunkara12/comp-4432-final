Rails.application.routes.draw do
  root "home#index"

  get '/make-acct', to: 'students#new'          #routes for signing in/signing out/authentication
  post '/make-acct', to: 'students#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signoff', to: 'sessions#destroy', as: :signoff    #creates new sessions if the user signs in and destroys session on sign out
  get '/student-dashboard', to: 'courses#index' #gets student dashboard of courses after sign in

  #next routes for students to show, edit, and update them by patch to save changes based on their id
  get 'students/:id', to: 'students#show', as: :user 
  get 'students/:id/edit', to: 'students#edit', as: :edit_user 
  patch 'students/:id', to: 'students#update'

  #next we do the same for courses to show the index of courses and the course based on the id
  get '/courses', to: 'courses#index', as: :courses 
  get '/courses/:id', to: 'courses#show', as: :course

 #next with grades 
  get '/grades', to: 'grades#index', as: :grades 
  get '/grades/:id', to: 'grades#show', as: :grade

 #now an admin page
  get '/admin', to: 'admin#index', as: :admin

 #finally im going to do the routes for the flawed version of the page to allow for exploitation
  patch '/flawed/students/:id', to: 'flawed#students_update', as: :flawed_student
  get '/flawed/students/:id/edit', to: 'flawed#students_edit', as: :edit_flawed_student
  get '/flawed/grades/:id', to: 'flawed#show_grade', as: :flawed_grade
  get '/flawed/admin', to: 'flawed#admin', as: :flawed_admin



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
