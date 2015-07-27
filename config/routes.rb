Rails.application.routes.draw do
  resources :cadres, except: :delete
  resources :roles

  resources :stories do
    resources :comments
    resources :children, controller: :stories
  end

  get '/auth/artsy', as: :new_session
  get '/auth/artsy/callback', to: 'sessions#create'

  root 'stories#index'
end
