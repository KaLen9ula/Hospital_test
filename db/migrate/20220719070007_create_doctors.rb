class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.references :user, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
