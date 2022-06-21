Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'

  }
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    resources :posts, path: 'blog'
    resources :countries, path: 'countries'
    resources :programs, path: 'programs'
    resources :residences, path: 'residences'

    get 'blog', to: 'home#blog'
    get 'about', to: 'home#about'
    get 'contact', to: 'home#contact'
    get 'residences', to: 'home#residences'
    get 'residences', to: 'home#programs'
    get 'home/index'
    root to: 'home#index'

    post 'home/index', to: 'orders#create'
    post 'countries[:index, :show]', to: 'orders#create'
    post 'posts[:index, :show]', to: 'orders#create'
    get 'search', to: 'residences#search'

    resources :residences do
      resources :orders
      resources :likes
    end

    resources :countries do
      resources :orders
    end

    resources :posts do
      resources :orders
    end

    resources :programs do
      resources :orders
    end

    resources :likes
    resources :views
    resources :testimonials
    resources :orders
  end
end
