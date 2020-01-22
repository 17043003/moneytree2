Rails.application.routes.draw do

  # namespace :admin do
  #   get 'user/top'
  # end
  get 'passwords/edit'
  get 'accounts/show'
  get 'accounts/edit'

  root 'users#top'
  

  resources :users do
    resources :budgets, except: [:edit, :update] do
      collection do
        get :graph
      end
    end
  end

  namespace :admin do
    root 'users#top'
  end

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end