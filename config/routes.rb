Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :posts,only: [:index,:new,:create,:edit,:update,:destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
