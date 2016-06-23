class DropApp < ActiveRecord::Migration
  def change
	drop_table :apps
  end
end
