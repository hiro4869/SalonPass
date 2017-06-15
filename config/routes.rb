Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
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
    resources :products do
      collection do
        get :owner_index
      end
    end

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
    resources :shopcarts,only: [:index, :create ,:update, :destroy]
    member do
      get :profile_edit
      patch :profile_update
    end
  end
  resources :salon_applyings, only: [:create, :show]
  resources :salon_approveds, only: [:create, :show]

  root 'roots#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
