Rails.application.routes.draw do
  
  namespace :admin do
    get 'categories/index'
    get 'categories/edit'
  end
  namespace :admin do
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'chats/new'
    get 'chats/show'
    get 'chats/index'
  end
  namespace :public do
    get 'bookmarks/index'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :public do
    get 'homes/top'
  end
# 顧客用
devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
