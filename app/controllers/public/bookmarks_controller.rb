class Public::BookmarksController < ApplicationController
 def index
  @bookmarks = current_user.bookmarks.includes(:user).order(created_at: :desc)
 end
  
 def create
  @post = Post.find(params[:post_id])
  @bookmark = @post.bookmarks.new(user_id: current_user.id)
  if @bookmark.save
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
