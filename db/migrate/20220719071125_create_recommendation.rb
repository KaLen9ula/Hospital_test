class CreateRecommendation < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.references :doctor, foreign_key: {to_table: :doctors}
      t.references :patient, foreign_key: {to_table: :patients}

      t.string :recommendation

      t.timestamps
    end
  end
end
