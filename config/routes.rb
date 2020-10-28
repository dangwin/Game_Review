Rails.application.routes.draw do
resources :games, :review, :users
get '/signup' => 'users#new'
post '/signup' => 'users#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'



root 'landing#home'
end
