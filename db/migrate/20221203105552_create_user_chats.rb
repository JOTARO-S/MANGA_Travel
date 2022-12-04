class CreateUserChats < ActiveRecord::Migration[6.1]
  def change
    create_table :user_chats do |t|
      t.integer :user_id,           null: false
      t.integer :chat_id,           null: false
      t.text :message,              null: false

      t.timestamps
    end
  end
end
