Rails.application.routes.draw do
  get 'gifs/new'
  get 'gifs/index'
  get 'gifs/create'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :gifs

  root to: "home#index"
end
