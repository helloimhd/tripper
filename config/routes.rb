Rails.application.routes.draw do
  resources :trips
  devise_for :users
  resources :categories
  #resources :expenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  get '/trips/:id/expenses' => 'expenses#index', as: 'expenses'
  get '/trips/:id/expenses/new' => 'expenses#new', as: 'new_expense'
  post '/trips/:id/expenses' => 'expenses#create'
  get '/trips/:id/expenses/:id' => 'expenses#show' , as: 'expense'
   get '/trips/:id/expenses/:id/edit' => 'expenses#edit', as: 'edit_expense'
  patch '/trips/:id/expenses/:id' => 'expenses#update'
  delete '/trips/:id/expenses/:id' => 'expenses#destroy'

end