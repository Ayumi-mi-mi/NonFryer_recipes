class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :model, null: false
      t.integer :preheat_time
      t.integer :preheat_temperature
      t.integer :time, null: false
      t.integer :temperature, null: false
      t.text :point
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
