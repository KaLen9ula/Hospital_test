class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :doctor, foreign_key: {to_table: :doctors}

      t.timestamps
    end
  end
end
