FitchSlap::Application.routes.draw do
  resources :pictures, only: :create

  match '/random' => 'random#show'
end
