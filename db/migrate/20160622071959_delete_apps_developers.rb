class DeleteAppsDevelopers < ActiveRecord::Migration
  def change
	drop_table :apps_developers
  end
end
