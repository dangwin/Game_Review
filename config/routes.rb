Rails.application.routes.draw do
    root 'landing#home'
    get '/auth/google_oauth2/callback', to: 'users#omniauth'

resources :games do
    resources :reviews
end
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
  


