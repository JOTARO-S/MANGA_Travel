class Admin::ChatsController < ApplicationController
before_action :authenticate_admin!

def index
    @chats = Chat.all.page(params[:page]).order(created_at: "DESC").per(8)
end

def show
    @chat = Chat.find(params[:id])
    @chat_messages = @chat.messages.order(created_at: "DESC").page(params[:page]).per(10)
end

def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to admin_chat_path, notice: "削除しました。"
end


end
