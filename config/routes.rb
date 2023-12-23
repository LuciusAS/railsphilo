Rails.application.routes.draw do
  devise_for :users
  resources :philosophers
  #get 'home/index'
  get 'home/about'
  #root 'home#index'
  root 'philosophers#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
