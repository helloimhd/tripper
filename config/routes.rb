Rails.application.routes.draw do
  resources :trips
  devise_for :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  get 'trips/:id/flights/new' => 'flights#new', as: 'new_flight'
  post '/flights' => 'flights#create'

  get '/flights/:id' => 'flights#show' , as: 'flight'

end