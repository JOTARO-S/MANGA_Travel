class UserChatsController < ApplicationController
     before_action :authenticate_user!
    
 def create
    chat = Chat.find(params[:chat_id])
    comment = current_user.comments.new(user_chats_comment_params)
    comment.chat_id = chat.id
    if comment.save
     redirect_to chat_path(chat), notice: "コメントを投稿しました"
    else
     render "chats/show"
    end
 end
 
 def destroy
    Comment.find(params[:id]).destroy
    redirect_to chat_path(params[:chat_id]), alert: "コメントを削除しました"
 end
 
 private
 
 def user_chats_comment_params
  params.require(:user_chat).permit(:message)
 end

end
