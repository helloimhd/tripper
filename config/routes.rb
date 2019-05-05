Rails.application.routes.draw do
  resources :trips
  devise_for :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  get '/flights/new' => 'flights#new', as: 'new_flight'
  post '/flights' => 'roasts#create'

  get '/flights/:id' => 'flights#show' , as: 'flight'


  get '/expenses/new' => 'expenses#new', as: 'new_expense'



  get '/expenses' => 'expenses#index', as: 'expenses'

end