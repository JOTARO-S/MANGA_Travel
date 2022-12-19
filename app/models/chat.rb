class Chat < ApplicationRecord
    belongs_to :user ##ユーザー
    has_many :messages, dependent: :destroy ##メッセージ
    
    ##ヴァリテーション
    validates :title, presence: true
    validates :explanation,presence: true, length: {maximum: 200}
    
    ##チャット検索
    def self.looks(search, word)
      @chat = Chat.where("title LIKE?", "%#{word}%")
    end
    
end
