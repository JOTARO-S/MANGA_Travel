class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :message_content,      null: false
      t.references :user
      t.references :chat, foreign_key: true

      t.timestamps
    end
  end
end
