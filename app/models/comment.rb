class Comment < ApplicationRecord
    belongs_to :user ##ユーザー
    belongs_to :post ##投稿
    
    ##ヴァリテーション
    validates :comment_content,presence:true,length:{maximum: 200}
end
