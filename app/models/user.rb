class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts , dependent: :destroy
  has_many :chats , dependent: :destroy
  has_many :comments , dependent: :destroy
  has_many :bookmarks , dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post
  has_many :user_chats,dependent: :destroy
  
  has_one_attached :user_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :explanation, length: {maximum: 50}
  
  def get_user_image
    (user_image.attached?) ? user_image : "no_image.jpg"
  end
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def self.looks(search, word)
      @user = User.where("name LIKE?", "%#{word}%")
  end
  
  def self.guest
    find_or_create_by!(name: "guestuser", email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  
end
