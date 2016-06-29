class ChangeAppTypeToInt < ActiveRecord::Migration
  def change
  	change_column :bugs, :app, :integer
  end
end
