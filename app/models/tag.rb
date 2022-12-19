class Tag < ApplicationRecord
    has_many :post_tags,dependent: :destroy, foreign_key: "tag_id" #タグ中間テーブル
    has_many :posts,through: :post_tags #投稿
    
    ##ヴァリテーション
    validates :tag_name, length: { maximum: 15 }, uniqueness: true, presence: true
  
end

