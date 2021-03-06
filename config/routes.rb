Rails.application.routes.draw do

  get 'passwords/edit'
  get 'accounts/show'
  get 'accounts/edit'

  root 'budgets#top'
  

  resources :users, only: [:new, :create, :destroy] do
    resources :budgets, except: [:edit, :update] do
      collection do
        get :graph
      end
    end
  end

  namespace :admin do
    root 'users#top'
    resources :users do
      resources :budgets, except: [:edit, :update] do
        collection do
          get :graph
        end
      end
    end
  end

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end