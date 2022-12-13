class Public::ChatsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def new
    @chat = Chat.new
  end

  def index
    @chats = Chat.all
  end

  def show
    @chat= chat.find(params[:id])
    @chat_comment = Comment.new
    @chat_tags = @chat.tags
  end
  
  def create
    @chat = current_user.chats.new(chat_params)
    tag_list = params[:chat][:tag_name].split(nil)
      if @chat.save
        @chat.save_tag(tag_list)
        redirect_to chat_path(@chat.id)
      else
      render :new, notice: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください。"
      end
  end
  
  def destroy
    @chat= chat.find(params[:id])
    @chat.destroy
    redirect_to chats_path, notice: "削除しました。"
  end
end
