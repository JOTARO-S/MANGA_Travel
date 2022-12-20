class Relationship < ApplicationRecord
  #belongs_to :user #ユーザー
　#belongs_to :follower, class_name: 'User' #フォロー（される）
  
  #バリデーション
  #with_options presence: true do
    #validates :user_id
    #validates :follower_id
  #end
end
