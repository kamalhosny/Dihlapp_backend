class CreateConversationMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_members do |t|
      t.references :conversation_id, foreign_key: true
      t.reference :user_id
      t.timestamp :seen_at

      t.timestamps
    end
  end
end
