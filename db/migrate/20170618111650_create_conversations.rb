class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :last_message_id, null: false, uniqueness: true
      t.timestamps
    end
  end
end
