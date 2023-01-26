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
    ## 通知機能
    has_many :notifications, dependent: :destroy
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
  
  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
  
  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
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
