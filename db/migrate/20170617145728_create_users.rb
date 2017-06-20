class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :avatar
      t.string :status, null: false, default:"offline"
      t.text :personal_status, default:""
      t.string :email, null: false, unique: true
      t.text :token, null:false, unique: true
      t.timestamps
    end
  end
end
