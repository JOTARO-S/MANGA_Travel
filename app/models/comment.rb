class Comment < ApplicationRecord
    belongs_to :user ##ユーザー
    belongs_to :post ##投稿
    ## 通知機能
    has_many :notifications, dependent: :destroy
    
    ##ヴァリテーション
    validates :comment_content,presence:true,length:{maximum: 200}
end
