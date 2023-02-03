class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable, :confirmable, :lockable,
         :timeoutable, :trackable
  
  ##投稿       
  has_many :posts , dependent: :destroy
  has_many :comments , dependent: :destroy
  ##ブックマーク
  has_many :bookmarks , dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post
  ##チャット
  has_many :chats , dependent: :destroy
  has_many :messages, dependent: :destroy
  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  # DM機能
  has_many :entries, dependent: :destroy
  has_many :directmails, dependent: :destroy
 
  #通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  ## プロフィール画像
  has_one_attached :user_image

  ##ヴァリテーション
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :explanation, length: {maximum: 50}
  
  ## プロフィール画像（NoImage）
  def get_user_image
    (user_image.attached?) ? user_image : "no_image.jpg"
  end
  
  ## 退会機能
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  ## 投稿検索
  def self.looks(search, word)
      @user = User.where("name LIKE?", "%#{word}%")
  end
  
  ## ゲスト機能
  
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.id = 1
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now # ← Confirmable を設定している場合は追加
      user.name = "ゲストユーザー" # ←ユーザー名を設定している場合は追加
      user.explanation = "ゲストユーザーです。"
    end
  end
  
  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
# フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
# フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
  
end
