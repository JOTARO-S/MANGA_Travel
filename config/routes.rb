Rails.application.routes.draw do
  
  namespace :admin do
    root to: "homes#top"
    resources :users, except: [:new, :create, :destroy]
    resources :posts, except: [:new, :create] do
      resources :comments, only: [:destroy]
    end
    resources :categories, except: [:new, :show]
  end
  scope module: :public do
    root to: "homes#top"
    get "bookmarks" => "bookmarks#index", as: "bookmarks"
    get "users/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
    patch "users/withdraw" => "users#withdraw", as: "withdraw"
    resources :users, except: [:new, :create, :destroy]
    get "posts/draft/:id" => "posts#draft", as: "draft"
    patch "posts/draft/:id" => "posts#draft_edit", as: "draft_edit"
    delete "posts/draft/:id" => "posts#draft_destroy", as: "draft_destroy"
    resources :posts do
      resource :bookmarks, only: [:create,:destroy]
      resources :comments, only: [:create,:destroy]
      resources :tags, only: [:create,:destroy]
    end
    resources :chats, except: [:edit, :update]
  end
# 顧客用
devise_for :user, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
