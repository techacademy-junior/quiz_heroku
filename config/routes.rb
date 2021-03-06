Rails.application.routes.draw do

  root 'messages#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :questions
  resources :messages
end
