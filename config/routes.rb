Rails.application.routes.draw do
  devise_for :users
  namespace :v1, defaults: { format: 'json' } do
    resources :creations, only: [:index, :show, :create, :destroy]
    resources :purchases, only: [:index, :show, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
