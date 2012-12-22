FitchSlap::Application.routes.draw do
  root to: 'add_picture_requests#new'

  resources :pictures, only: :create
  resources :add_picture_requests, only: [:new, :create]

  match '/random' => 'random#show'
end
