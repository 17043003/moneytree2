Rails.application.routes.draw do
  get 'budgets/index'
  get 'budgets/show'
  get 'budgets/new'
  get 'budgets/edit'
  get 'passwords/edit'
  get 'accounts/show'
  get 'accounts/edit'
  root "users#top"

  resources :users

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
