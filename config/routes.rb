Rails.application.routes.draw do
  resources :cadres, except: :delete
  resources :stories do
    resources :comments
    resources :children, controller: :stories
  end

  root 'stories#index'
end
