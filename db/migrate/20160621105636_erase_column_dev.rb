class EraseColumnDev < ActiveRecord::Migration
  def change
	remove_column :apps, :developer_id
  end
end
