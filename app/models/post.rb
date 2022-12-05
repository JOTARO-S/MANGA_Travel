class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    has_many :comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    
    has_many_attached :post_image
  
  def get_category_name
    Category.find(category_id).name
  end
  
  validates :name, length: { maximum: 30 }
  validates :explanation, length: { maximum: 255 }
    
end
