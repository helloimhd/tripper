Rails.application.routes.draw do
  resources :trips
  devise_for :users
  resources :categories
  #resources :expenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

###############   TO DO   ###################
  get '/todos' => 'todos#index', as: 'todo'
  get '/todos/new' => 'todos#new', as: 'new_todo'
  post '/todos' => 'todos#create'
  get '/todos/:id' => 'todos#show'
  get '/todos/:id/edit' => 'todos#edit', as: 'edit_todo'
  patch '/todos/:id' => 'todos#update'
  delete '/todos/:id' => 'todos#destroy', as: 'destroy_todo'


#################   TRIPS   #######################
  get '/trips/:trip_id/expenses' => 'expenses#index', as: 'expenses'
  get '/trips/:trip_id/expenses/new' => 'expenses#new', as: 'new_expense'
  post '/trips/:trip_id/expenses' => 'expenses#create'
  get '/trips/:id/expenses/:id' => 'expenses#show' , as: 'expense'
   get '/trips/:trip_id/expenses/:id/edit' => 'expenses#edit', as: 'edit_expense'
  patch '/trips/:trip_id/expenses/:id' => 'expenses#update'
  delete '/trips/:trip_id/expenses/:id' => 'expenses#destroy'


###################   FLIGHTS   ##################
  get '/trips/:trip_id/flights' => 'flights#index', as: 'flights'
  get 'trips/:trip_id/flights/new' => 'flights#new', as: 'new_flight'
  post 'trips/:trip_id/flights' => 'flights#create'
  get 'trips/:trip_id/flights/:id' => 'flights#show' , as: 'flight'

  get 'trips/:trip_id/flights/:id/edit' => 'flights#edit' , as: 'edit_flight'
  patch '/trips/:trip_id/flights/:id' => 'flights#update'

  delete '/trips/:trip_id/flights/:id' => 'flights#destroy'


end