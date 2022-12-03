class Chat < ApplicationRecord
    belongs_to :user
    has_many :user_chats,dependent: :destroy
    
end
