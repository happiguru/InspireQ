Rails.application.routes.draw do
  root "quotes#index"
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :quotes do
    resources :replies, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: %i[create destroy]
end
