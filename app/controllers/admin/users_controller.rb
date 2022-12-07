class Admin::UsersController < ApplicationController
before_action :authenticate_admin!
    def index
      @users = User.all
    end
    
    def show
      @user = User.find(params[:id])
      @posts = @user.posts
    end
    
   def update
      @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to admin_user_path(@user), notice: "プロフィールを更新しました。"
        else
          render "show"
        end
   end
   
   private

    def user_params
      params.require(:user).permit(:email, :name, :explanation, :user_image, :is_deleted)
    end
end
