class Public::CommentsController < ApplicationController
 before_action :authenticate_user!
    
 def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(post_comment_params)
    @comment.user_id = current_user.id
    if @comment.save
     redirect_to request.referer, notice: "コメントを投稿しました"
    else
     redirect_to request.referer
    end
 end
 
 def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
     redirect_to request.referer, notice: "コメントを削除しました"
    else
     redirect_to request.referer
    end
 end
 
 private
 
 def post_comment_params
  params.require(:comment).permit(:comment_content, :post_id, :user_id)
 end
end
