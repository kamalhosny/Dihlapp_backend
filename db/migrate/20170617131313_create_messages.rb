class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      # t.timestamp :delivered_at
      # t.timestamp :read_at
      t.integer :sender_id
      t.references :conversation, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
