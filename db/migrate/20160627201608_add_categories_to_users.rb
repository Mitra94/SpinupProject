class AddCategoriesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :categories, :string, array: true, default: []
  end
end
