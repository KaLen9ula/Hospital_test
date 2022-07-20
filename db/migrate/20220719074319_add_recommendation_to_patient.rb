class AddRecommendationToPatient < ActiveRecord::Migration[6.1]
  def change
    add_reference :users,:recommendation, foreign_key: {to_table: :recommendations}
  end
end
