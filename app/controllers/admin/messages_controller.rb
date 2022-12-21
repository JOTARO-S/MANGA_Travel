class Admin::MessagesController < ApplicationController
before_action :authenticate_admin!
 
 def update
   @message = Message.find_by(id: params[:id], chat_id: params[:chat_id])
   @message.message_content = "不適切なコメントの為、削除されました。"
   if @message.save
    redirect_to request.referer, notice: "コメントを削除しました。"
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
