class CreateIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :quantity
      t.references :recipe, foreign_key: true, null: false

      t.timestamps
    end
  end
end
