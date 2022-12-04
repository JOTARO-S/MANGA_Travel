class Public::UsersController < ApplicationController

    
    def index
      @users = User.all
    end
    
    def show
      @user = User.find(params[:id])
    end
    
    def edit
      @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to user_path(@user), notice: "You have updated user successfully."
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
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    end
    
    
private

    def user_params
      params.require(:user).permit(:email, :name, :address, :explanation)
    end
end
