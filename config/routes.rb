Rails.application.routes.draw do
  get "/events/show_text" => "events#show_text"

  resources :events
  resources :friends
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
