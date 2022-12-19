class Category < ApplicationRecord
    has_many :posts,dependent: :destroy ##投稿
    
end
