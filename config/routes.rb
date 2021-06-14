Rails.application.routes.draw do
  root 'posts#index', as: 'home'

  resources :posts do
    resources :mark
  end

end
