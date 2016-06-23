class DeleteAppDevelopers < ActiveRecord::Migration
  def change
	drop_table :app_developers
  end
end
