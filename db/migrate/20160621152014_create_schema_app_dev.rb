class CreateSchemaAppDev < ActiveRecord::Migration
  def change
    create_table :app_developers, :id => false do |t|
		t.integer :app_id
		t.integer :developer_id
    end
    add_index :app_developers, [:app_id, :developer_id]
  end
end
