class PostTag < ApplicationRecord
    belongs_to :post ##投稿
    belongs_to :tag ##タグ
    
    ##ヴァリテーション
    validates :post_id, presence: true
    validates :tag_id, presence: true
    
end
