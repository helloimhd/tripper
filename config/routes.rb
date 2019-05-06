Rails.application.routes.draw do
  resources :trips
  devise_for :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'


  get '/todos' => 'todos#index', as: 'todo'
  post 'todos' => 'todos#create'
  get '/todos/new' => 'todos#new', as: 'new_todo'
  get '/todos/:id' => 'todos#show'
  get '/todos/:id/edit' => 'todos#edit', as: 'edit_todo'
  patch '/todos/:id' => 'todos#update'
  delete '/todos/:id' => 'todos#destroy'

  

end