class DeleteTable < ActiveRecord::Migration
  def change
	drop_table :microposts
  end
end
