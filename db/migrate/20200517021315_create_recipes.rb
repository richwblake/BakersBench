class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :total_prep_time
      t.integer :creator_id

      t.timestamps
    end
  end
end
