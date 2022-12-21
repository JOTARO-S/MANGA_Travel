Rails.application.routes.draw do
  
  namespace :admin do
    get "comments" => "comments#index", as: "comments"
    resources :users, except: [:new, :edit, :create, :destroy]
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
    resources :users, except: [:new, :create, :destroy]
    get "posts/draft" => "posts#draft", as: "draft"
    resources :posts do
      resource :bookmarks, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      resources :tags, only: [:create, :destroy]
    end
    resources :chats, except: [:edit, :update] do
      resources :messages, only: [:create, :destroy]
    end
  end
  
# 顧客用
devise_for :user, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  passwords: 'public/passwords'
}

devise_scope :user do
    post 'user/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

# 管理者用
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
