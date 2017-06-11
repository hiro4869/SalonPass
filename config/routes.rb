Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :owners, controllers: {
    sessions:      'owners/sessions',
    passwords:     'owners/passwords',
    registrations: 'owners/registrations'
  }

  resources :salons, only: [:show] do
    resources :salon_informations, only: [:new, :create, :edit, :update]

    resources :posts do
      resources :post_comments
      collection do
        get :owner_index
      end
    end

    member do
      get :salon_index
      get :owner
    end
  end

  resources :owner, only: [] do
    member do
      get :profile_edit
      patch :profile_update
    end
  end

  resources :user, only: [:show] do
    member do
      get :profile_edit
      patch :profile_update
    end
  end
  resources :salon_applyings, only: [:create]
  resources :salon_approveds, only: [:create]

  root 'roots#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
