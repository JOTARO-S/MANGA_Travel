class Admin::CommentsController < ApplicationController
 
 def index
  @comments = Comment.all.page(params[:page])
 end
    
 def create
 end
 
 def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
 end
 
 def update
  post = Post.find(params[:post_id])
  comment = Comment.find(params[:id])
  comment.comment_content = "不適切なコメントの為、削除されました。"
  if comment.save
  redirect_to admin_post_path(post), notice: "コメントを削除しました。"
  end
 end
 
 private
 
 def post_comment_params
  params.require(:comment).permit(:comment_content)
 end
end
