Rails.application.routes.draw do
  root "application#index"
  resources :users
  resources :potlucks
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
end
