Rails.application.routes.draw do
  devise_for :coaches
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :users, only: [:show, :edit]
  resources :coaches, only: :edit
  resources :trainings, only: [:new, :create, :show, :destroy, :edit, :update]
end
