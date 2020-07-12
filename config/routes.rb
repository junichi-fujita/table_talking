Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'home#index'
  resources :recruitments do
    resources :subscriptions
  end
end
