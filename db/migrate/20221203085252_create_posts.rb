class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id,           null: false
      t.integer :category_id,       null: false
      t.string :name,               null: false
      t.string :place,              null: false
      t.text :explanation,          null: true
      t.boolean :is_active,         null: false, default: false
      t.boolean :draft_status,      null: false, default: false
      
      t.timestamps
    end
  end
end
