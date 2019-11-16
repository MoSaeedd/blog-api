Rails.application.routes.draw do
  resources :posts do
    resources :comments
    resources :tags
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end