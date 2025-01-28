class RemoveTimeAndTemperatureFromRecipes < ActiveRecord::Migration[7.2]
  def change
    remove_column :recipes, :time, :integer
    remove_column :recipes, :temperature, :integer
  end
end
