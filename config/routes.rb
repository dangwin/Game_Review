Rails.application.routes.draw do
resources :games, :review, :users




root 'games#index'
end
