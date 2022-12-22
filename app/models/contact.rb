class Contact < ApplicationRecord
    
    ##ヴァリテーション
    validates :name, length: { maximum: 30 }, presence: true
    validates :phone_number, length: { minimum: 10, maximum: 12 }, presence: true
    validates :email, presence: true
    validates :subject, length: { maximum: 50 }, presence: true
    validates :message, length: { maximum: 500 }, presence: true
end
