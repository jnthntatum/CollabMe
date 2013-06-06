class CreateChatSessions < ActiveRecord::Migration
  def change
    create_table :chat_sessions do |t|
      t.integer :userA_id
      t.integer :userB_id
      t.string :messages_blob
      t.string :drawables_blob
      t.timestamps
    end
  end
end
