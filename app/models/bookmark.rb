class Bookmark < ApplicationRecord
    belongs_to :user ##ユーザー
    belongs_to :post ##投稿
    
    ##ヴァリテーション
    validates :user_id, uniqueness: { scope: :post_id }
end
