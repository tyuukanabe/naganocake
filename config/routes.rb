Rails.application.routes.draw do
  get 'searches/search'
  namespace :public do
    get 'genres/show'
  end
  get 'search' => 'searches#search'
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customer,skip: [:passwords,], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :items,except: [:destroy]
    resources :customers, except: [:destroy, :create, :new]
    resources :genres, except: [:destroy, :show, :new]
    get '/' => 'homes#top'
    resources:orders, only: [:index, :show, :update] do
      resources:order_items, only: [:update]
    end
  end

  scope module: :public do
    resources :customers, except: [:destroy]
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
    resources :genres, only: [:show]
    patch 'unsubscribe' => 'customers#unsubscribe'
    get 'confirm' => 'customers#confirm'
    resources :items, only: [:index, :show]
    resources :cart_items, except: [:edit, :new, :show]
    delete 'destroy_all' => 'cart_items#destroy_all'
    get 'orders/complete' => 'orders#complete'
    post 'orders/confirm' => 'orders#confirm'
    resources :orders, except: [:destroy, :edit]
    resources :addresses, except: [:new, :show]
  end




end
