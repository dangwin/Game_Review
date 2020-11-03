Rails.application.routes.draw do
    root 'landing#home'
resources :games, :review, :users
get '/signup' => 'users#new'
post '/signup' => 'users#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

resources :users, only: [:create, :show, :edit, :update]

get 'users', to: 'users#show'

resources :users do 
    resources :games, only: [:create, :show, :edit, :update] do 
    end 
    end
end
  


