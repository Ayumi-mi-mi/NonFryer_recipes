class CreateHeats < ActiveRecord::Migration[7.2]
  def change
    create_table :heats do |t|
      t.integer :time, null: false
      t.integer :temperature, null: false
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
