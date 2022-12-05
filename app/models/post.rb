class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    has_many :comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    
    has_one_attached :post_image
    
  def get_post_image
    (post_image.attached?) ? post_image : 'no_image.jpg'
  end
  
  validates :name, length: { maximum: 30 }
  validates :explanation, length: { maximum: 255 }
    
end
