class CreateInstructions < ActiveRecord::Migration[7.2]
  def change
    create_table :instructions do |t|
      t.integer :step_number
      t.text :description
      t.references :recipe, foreign_key: true, null: true

      t.timestamps
    end
  end
end
