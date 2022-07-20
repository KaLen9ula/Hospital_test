class AddCategoryToDoctor < ActiveRecord::Migration[6.1]
  def change
    add_reference :doctors, :category, foreign_key: { to_table: :categories }
  end
end
