class RenameAppColumn < ActiveRecord::Migration
  def change
  	rename_column :bugs, :app, :app_id
  end
end
