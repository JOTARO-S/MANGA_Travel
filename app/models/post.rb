class Post < ApplicationRecord
    belongs_to :user ##ユーザー
    belongs_to :category ##カテゴリー
    ## タグ
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    has_many :comments, dependent: :destroy ##コメント
    ## コメント
    has_many :bookmarks, dependent: :destroy
    has_many :bookmark_posts, through: :bookmarks, source: :post
    
    ##投稿画像
    has_many_attached :post_image
    
  ##カテゴリー  
  def get_category_id
    Category.find(category_id).id
  end
  
  def get_category_name
    Category.find(category_id).name
  end
  
  ##ブックマーク
  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
  
  ##タグ
  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
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
  
  ##投稿検索
  def self.looks(search, word)
      @post = Post.where("name LIKE?", "%#{word}%")
  end
  
  
  # バリデーション
  validate :add_error_posts
  
  def add_error_posts
    
    if name.blank?
      
      errors[:base] << "タイトルを入力してください。"
    end
    if name.length > 30
      errors[:base] << "タイトルは30文字以内で入力してください。"
    end
    if category.blank?
      errors[:base] << "所在地を選択してください。"
    end
    if place.blank?
      errors[:base] << "住所や場所の名前を入力してください。"
    end
    if place.length > 50
      errors[:base] << "住所や場所の名前は50文字以内で入力してください。"
    end
    if explanation.length > 255
      errors[:base] << "説明は255文字以内で入力してください。"
    end
    if post_image.length > 4
      errors[:base] << "画像は最大4枚まで可能です。"
    end
    
  end
  
end
