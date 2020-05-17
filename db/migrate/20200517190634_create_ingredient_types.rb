class CreateIngredientTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_types do |t|
      t.string :type_of_ingredient
      t.belongs_to :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
