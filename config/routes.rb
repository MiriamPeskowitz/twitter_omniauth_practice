Rails.application.routes.draw do
  # root 'pages/index'
  get '/auth/twitter/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :pages, only: [:index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
