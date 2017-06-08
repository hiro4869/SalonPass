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

  root 'roots#index'

  resources :owner, only: [:show] do
    member do
      get :salon_index
      get :owner
    end
  end

  resources :posts
  resources :salon_applyings


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
