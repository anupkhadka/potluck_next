Rails.application.routes.draw do
  root "application#index"
  resources :users
  resources :potlucks
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  get 'auth/failure', to: redirect("/")
  get '/potlucks/data' => 'potlucks#data'
end
