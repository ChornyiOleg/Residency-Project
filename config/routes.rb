Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'

  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :posts, path: 'blog'
  get 'blog', to: 'home#blog'
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  get 'home/index'
  root to: 'home#index'
  post 'home/index', to: 'orders#create'
  get 'search', to: 'residences#search'
  resources :residences do
    resources :orders
    resources :likes
  end
  resources :countries
  resources :programs
  resources :likes
  resources :views 


end
