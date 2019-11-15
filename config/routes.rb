Rails.application.routes.draw do
  resources :locations
  resources :users
  resources :albums
  resources :pictures
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
