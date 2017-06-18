class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.belongs_to :message
      t.actable

      t.timestamps
    end
  end
end
