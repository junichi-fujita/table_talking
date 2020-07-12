Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'home#index'
  resources :recruitments do
    get "comment_new", on: :collection
    post "comment_create", on: :collection
  end
end
