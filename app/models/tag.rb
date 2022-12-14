class Tag < ApplicationRecord
    has_many :post_tags,dependent: :destroy, foreign_key: "tag_id"
    has_many :posts,through: :post_tags
    
    validates :tag_name, length: { minimum: 2, maximum: 15 }, uniqueness: true, presence: true
  
end

