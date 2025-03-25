class AddAuthorToRecipes < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :author, :string
  end
end
