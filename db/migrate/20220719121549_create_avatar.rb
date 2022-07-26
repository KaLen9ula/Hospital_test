class CreateAvatar < ActiveRecord::Migration[6.1]
  def change
    create_table :avatars do |t|
      t.references :user, null: false, foreign_key: true
      t.text :image_data

      t.timestamps
    end
  end
end
