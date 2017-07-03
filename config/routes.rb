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
    collection do
      get :search
    end
    member do
      get :salon_index
      get :owner
    end

    resources :salon_informations, only: [:new, :create, :edit, :update]
    resources :contents, only: [:index] do
      # collection do
      #   get :owner_index
      # end
    end
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
  end

  resources :owner, only: [] do
    member do
      get :profile_edit
      patch :profile_update
    end
  end


  resources :user, only: [:show] do
    resources :shopcarts, only: [:index, :create ,:update, :destroy] do
      collection do
        get :confirm
      end
    end
    resources :shopcart_afters, only: [:create ,:update, :destroy] do
      collection do
        post :return_cart
      end
    end
    resources :purchases, only: [:create,:index]

    member do
      get :profile_edit
      patch :profile_update
      get :salon_management
    end
  end

  resources :salon_applyings, only: [:create, :show, :destroy] do
    collection do
      delete :refusal
    end
  end  
  resources :salon_approveds, only: [:create, :show, :destroy] do
    collection do
      post :automatic_approval
      delete :leave
    end
  end    

  root 'roots#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
