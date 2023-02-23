Rails.application.routes.draw do
  devise_for :favorites
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :customers, controllers: {
  passwords: "public/passwords",
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_scope :customer do
    get '/customers/sign_out' => 'devise/sessions#destroy'
  end

   devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end

  namespace :public do
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resources :customers, only: [:show, :edit, :update] do
      #member do
        #get :favorites
      #end
      collection do
        get '/customers/confirmation' => 'customers#confirmation'
        patch 'withdrawal'
      end
    end
    resources :posts
    resource :favorites, only: [:create, :destroy]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    resources :posts, only: [:index, :show]
    resources :genres, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  root to: 'public/homes#top'
  get '/admin' => 'admin/homes#top'
  get 'home/about' => 'public/homes#about', as: 'about'
  get "search" =>  "searches#search"
  delete 'posts/:id' => 'posts#destroy'
end
