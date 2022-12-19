class Chat < ApplicationRecord
    belongs_to :user
    has_many :messages, dependent: :destroy
    
    validates :title, presence: true
    validates :explanation,presence: true, length: {maximum: 200}
    
    def self.looks(search, word)
      @chat = Chat.where("title LIKE?", "%#{word}%")
    end
    
end
