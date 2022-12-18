class Chat < ApplicationRecord
    belongs_to :user
    has_many :user_chats,dependent: :destroy
    
    validates :explanation,presence:true,length:{maximum: 200}
    
end
