class UserChatsController < ApplicationController
     before_action :authenticate_user!
    
 def create
    chat = Chat.find(params[:chat_id])
    comment = current_user.comments.new(user_chats_comment_params)
    comment.chat_id = chat.id
    comment.save
    redirect_to chat_path(chat)
 end
 
 def destroy
    Comment.find(params[:id]).destroy
    redirect_to chat_path(params[:chat_id])
 end
 
 private
 
 def user_chats_comment_params
  params.require(:user_chat).permit(:message)
 end

end
