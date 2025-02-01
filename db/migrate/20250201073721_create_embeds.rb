class CreateEmbeds < ActiveRecord::Migration[7.2]
  def change
    create_table :embeds do |t|
      t.integer :kind
      t.string :url
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
