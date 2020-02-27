Rails.application.routes.draw do
  resources :events
  resources :friends
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
  root 'application#hello'
end
