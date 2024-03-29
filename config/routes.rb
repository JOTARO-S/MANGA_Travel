Rails.application.routes.draw do

  namespace :public do
    get 'directmails/show'
  end
# 顧客用
devise_for :user, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  passwords: 'public/passwords'
}

devise_scope :user do
  post "user/guest_sign_in", to: "public/sessions#guest_sign_in"
end

# 管理者用
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  
  namespace :admin do
    root to: "posts#index"
    get "comments" => "comments#index", as: "comments"
    resources :users, except: [:new, :edit, :create]
    resources :posts, except: [:new, :create] do
      resources :comments, only: [:create, :destroy, :update]
    end
    resources :categories, except: [:new, :show]
    resources :chats, only: [:index, :show, :destroy] do
      resources :messages, only: [:create, :destroy]
    end
  end
  scope module: :public do
    root to: "homes#top"
    get "help" => "homes#help"
    get "privacy" => "homes#privacy"
    get "terms" => "homes#terms"
    get "inquiry" => "homes#inquiry"
    get "search" => "searches#search"
    get "bookmarks" => "bookmarks#index", as: "bookmarks"
    get "users/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
    patch "users/withdraw" => "users#withdraw", as: "withdraw"
    resources :users, except: [:new, :create, :destroy] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    get "posts/draft" => "posts#draft", as: "draft"
    get "posts/is_active" => "posts#is_active", as: "is_active"
    get "directmail/:id" => "directmails#show", as: "directmail"
    resources :directmails, only: [:create]
    resources :posts do
      resource :bookmarks, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      resources :tags, only: [:create, :destroy]
    end
    resources :chats, except: [:edit, :update] do
      resources :messages, only: [:create, :destroy]
    end
    resources :contacts, only: [:new, :create]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'done', to: 'contacts#done', as: 'done'
    resources :notifications, only: [:index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
