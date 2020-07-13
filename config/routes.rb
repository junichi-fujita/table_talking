Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'home#index'
  resources :recruitments do
    resources :subscriptions do
      patch "accept", on: :member
      patch "reject", on: :member
    end
  end
end
