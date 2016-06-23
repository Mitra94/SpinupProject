class RenameColumn < ActiveRecord::Migration
  def change
	rename_column :microposts, :app_id_id, :app_id
  end
end
