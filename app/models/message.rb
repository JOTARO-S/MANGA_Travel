class Message < ApplicationRecord
    belongs_to :user
    belongs_to :chat
    
    validates :message_content, presence: true
end
