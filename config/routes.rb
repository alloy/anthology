Rails.application.routes.draw do
  resources :stories do
    resources :comments
  end
end
