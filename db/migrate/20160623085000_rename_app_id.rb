class RenameAppId < ActiveRecord::Migration
  def change
	rename_column :microposts, :app_id, :developer_id
  end
end
