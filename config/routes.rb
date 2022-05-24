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
  get 'home/index'
  root to: 'home#index'
end
