class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :sub_comment
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
