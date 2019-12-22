Rails.application.routes.draw do
  get 'accounts/show'
  get 'accounts/edit'
  root "users#top"

  resources :users

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
