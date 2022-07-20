class CreateAppointment < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :doctor, foreign_key: {to_table: :doctors}
      t.references :patient, foreign_key: {to_table: :patients}

      t.text :recommendation
      t.string :status

      t.timestamps
    end
  end
end
