class CreateDirectmails < ActiveRecord::Migration[6.1]
  def change
    create_table :directmails do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
