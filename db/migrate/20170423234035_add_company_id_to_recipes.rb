class AddCompanyIdToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :company_id, :integer
  end
end
