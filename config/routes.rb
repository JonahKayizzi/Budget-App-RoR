Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  root '/' 
  aunthenticated :user do
    root 'categories#index'
  end
  resources :categories, only: [:index, :new, :create, :show] do
    resources :transactions, only: [:index, :new, :create]
  end
end
