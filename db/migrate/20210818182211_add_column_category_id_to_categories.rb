class AddColumnCategoryIdToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :category, foreign_key: true
  end
end
