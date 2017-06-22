class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.belongs_to :message, foreign_key: true
      t.string :url, null: false
    end
  end
end
