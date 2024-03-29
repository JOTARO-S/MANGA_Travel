class Public::ChatsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
    @chat = Chat.new
  end

  def index
    @chats = Chat.all.page(params[:page]).order(created_at: "DESC").per(8)
  end

  def show
    @chat = Chat.find(params[:id])
    @chat_message = Message.new
    @chat_messages = @chat.messages.order(created_at: "DESC").page(params[:page]).per(10)
  end
  
  def create
    @chat = current_user.chats.new(chat_params)
      if @chat.save
        redirect_to chat_path(@chat.id)
      else
      render :new, notice: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください。"
      end
  end
  
  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to chat_path, notice: "削除しました。"
  end
end

private

def chat_params
  params.require(:chat).permit(:title, :explanation)
end
