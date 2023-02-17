Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  resources :users
  resources :categories, only: [:index, :new, :create, :show] do
    resources :transactions, only: [:new, :create]
  end
  root 'home#index'
end
