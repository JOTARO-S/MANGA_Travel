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
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  
  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(tag_name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
   end
  end
  
  validates :name, length: { maximum: 30 }
  validates :explanation, length: { maximum: 255 }
    
end
