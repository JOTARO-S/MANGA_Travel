class CreateDirectmails < ActiveRecord::Migration[6.1]
  def change
    create_table :directmails do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :room_id, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
