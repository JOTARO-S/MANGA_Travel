class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  before_action :is_matching_login_user, only: [:edit, :update]
   

    
    def index
      @users = User.where(is_deleted: false).order(created_at: "DESC").page(params[:page]).per(12)
    end
    
    def show
      @user = User.find(params[:id])
      @posts = @user.posts.where(is_active: false, draft_status: false).order(created_at: "DESC").page(params[:page]).per(8)
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
    
    def is_matching_login_user
      user_id = params[:id].to_i
      unless user_id == current_user.id
        flash[:notice] = "そのページにはアクセスできません。"
        redirect_to root_path
      end
    end
    
    
end
