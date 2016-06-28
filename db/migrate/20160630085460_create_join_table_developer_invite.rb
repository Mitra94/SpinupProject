class CreateJoinTableDeveloperInvite < ActiveRecord::Migration
  def change
  	create_join_table :developers, :invites, column_options: {null: true} do |t|
	# t.index [:app_id, :developer_id]
	# t.index [:developer_id, :app_id]
	end
  end
end
