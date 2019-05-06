Rails.application.routes.draw do
  resources :trips
  devise_for :users
  resources :categories
  #resources :expenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'


  get '/todos' => 'todos#index', as: 'todo'
  post 'todos' => 'todos#create'
  get '/todos/new' => 'todos#new', as: 'new_todo'
  get '/todos/:id' => 'todos#show'
  get '/todos/:id/edit' => 'todos#edit', as: 'edit_todo'
  patch '/todos/:id' => 'todos#update'
  delete '/todos/:id' => 'todos#destroy'

  
  get '/trips/:id/expenses' => 'expenses#index', as: 'expenses'
  get '/trips/:id/expenses/new' => 'expenses#new', as: 'new_expense'
  post '/trips/:id/expenses' => 'expenses#create'
  get '/trips/:id/expenses/:id' => 'expenses#show' , as: 'expense'
   get '/trips/:id/expenses/:id/edit' => 'expenses#edit', as: 'edit_expense'
  patch '/trips/:id/expenses/:id' => 'expenses#update'
  delete '/trips/:id/expenses/:id' => 'expenses#destroy'
  
  
  get 'trips/:id/flights/new' => 'flights#new', as: 'new_flight'
  post '/flights' => 'flights#create'

  get '/flights/:id' => 'flights#show' , as: 'flight'


end