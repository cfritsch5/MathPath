class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.integer :lesson_id, default: 1
      t.integer :unit_id, default: 1
      
      t.timestamps null: false
    end

    add_index :users, :username, unique: true
  end
end
