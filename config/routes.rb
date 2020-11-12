Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :quotes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "quotes#index"
end
