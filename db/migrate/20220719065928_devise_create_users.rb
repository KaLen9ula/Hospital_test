class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :phone_num

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.string :first_name
      t.string :last_name

      t.integer :role, default: 0
      t.timestamps null: false
    end

    add_index :users, :reset_password_token, unique: true
  end
end
