class AddIngredientIdToAmount < ActiveRecord::Migration[6.0]
  def change
    add_column :amounts, :ingredient_id, :integer
  end
end
