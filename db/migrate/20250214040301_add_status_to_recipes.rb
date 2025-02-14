class AddStatusToRecipes < ActiveRecord::Migration[7.2]
  def change
    add_column :recipes, :status, :integer, null: false, default: 0
  end
end
