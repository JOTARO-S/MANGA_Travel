class Message < ApplicationRecord
    belongs_to :user ##ユーザー
    belongs_to :chat ##チャット
    
    ##ヴァリテーション
    validates :message_content, presence: true
end
