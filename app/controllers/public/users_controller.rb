class Public::UsersController < ApplicationController
  before_action :authenticate_user!
   before_action :ensure_guest_user, only: [:edit]

    
    def index
      @users = User.all
    end
    
    def show
      @user = User.find(params[:id])
      @posts = @user.posts
    end
    
    def edit
      @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to user_path(@user), notice: "プロフィールを更新しました。"
        else
          render "edit"
        end
    end
    
    def unsubscribe
    end
    
    def withdraw
      @user = User.find(current_user.id)
      # is_deletedカラムをtrueに変更することにより削除フラグを立てる
      @user.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました。"
      redirect_to root_path
    end
    
    
private

    def user_params
      params.require(:user).permit(:email, :name, :explanation, :user_image)
    end
    
    def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
    end
end
