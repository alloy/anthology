Rails.application.routes.draw do
  resources :stories do
    resources :comments
    resources :children, controller: :stories
  end
end
