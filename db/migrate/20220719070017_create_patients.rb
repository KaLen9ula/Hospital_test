class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.references :user, foreign_key: {to_table: :users}
      t.references :doctor, foreign_key: {to_table: :doctors}
      t.string :diagnose

      t.timestamps
    end
  end
end
