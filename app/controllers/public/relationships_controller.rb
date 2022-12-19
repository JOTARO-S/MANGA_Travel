class Public::RelationshipsController < ApplicationController
    
  # フォローするとき
  def create
    @user = User.find(params[:follower])
    current_user.follow(@user)
  end
  # フォロー外すとき
  def destroy
    @user = current_user.relationships.find(params[:id]).follower
    current_user.unfollow(params[:id])
  end
  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
