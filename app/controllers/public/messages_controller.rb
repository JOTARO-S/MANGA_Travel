class Public::MessagesController < ApplicationController
before_action :authenticate_user!
    
 def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params)
    @message.user_id = current_user.id
    if @message.save
     redirect_to request.referer, notice: "コメントを投稿しました"
    else
     redirect_to request.referer
    end
 end
 
 def destroy
    @message = Message.find_by(id: params[:id], chat_id: params[:chat_id])
    if @message.destroy
     redirect_to request.referer, alert: "コメントを削除しました"
    else
     redirect_to request.referer
    end
 end
 
 private
 
 def message_params
  params.require(:message).permit(:message_content, :chat_id, :user_id)
 end
end
