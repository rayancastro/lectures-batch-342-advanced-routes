Rails.application.routes.draw do
  # CRUD ROUTES for restaurants
  resources :restaurants do
    # Nested CRUD ROUTES for reviews
    resources :reviews, only: [:new, :create]

    # Customized routes for the collection of restaurants
    collection do
      get 'top', to: 'restaurants#top'
      # /restaurants/top => RestaurantsController # top
    end

    # Customized routes for a restaurant
    member do
      get 'chef', to: 'restaurants#chef'
      # /restaurants/42/chef => RestaurantsController # chef

      get 'menu', to: 'restaurants#menu'
      # /restaurants/42/menu => RestaurantsController # menu
    end
  end

  namespace :admin do
    resources :restaurants, only: [:index]
  end

end
