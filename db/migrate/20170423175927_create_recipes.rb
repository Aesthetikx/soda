class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :instructions

      t.timestamps
    end
  end
end
