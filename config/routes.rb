Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: %i[show]
  root 'home#index'
  resources :recruitments do
    resources :subscriptions, as: :participant_managements do
      patch "accept", on: :member
      patch "reject", on: :member
    end
  end
  resources :characters
end
