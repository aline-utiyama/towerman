Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events do
    resources :event_atendees
  end
  resources :event_atendees
  resources :proffessionals
  resources :recycles
end
