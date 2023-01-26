class Public::BookmarksController < ApplicationController
 before_action :authenticate_user!
 
 def index
  @bookmarks = current_user.bookmarks.includes(:user).order(created_at: :desc).page(params[:page]).per(8)
 end
  
 def create
  @post = Post.find(params[:post_id])
  @bookmark = @post.bookmarks.new(user_id: current_user.id)
  if @bookmark.save
   @post.create_notification_by(current_user)
  else
   redirect_to request.referer
  end
 end

 def destroy
  @post = Post.find(params[:post_id])
  @bookmark = @post.bookmarks.find_by(user_id: current_user.id)
  if @bookmark.present?
   @bookmark.destroy
  else
   redirect_to request.referer
  end
 end
  
end
