class Room < ApplicationRecord
 # DM 機能
 has_many :entries, dependent: :destroy
 has_many :directmails, dependent: :destroy
end
