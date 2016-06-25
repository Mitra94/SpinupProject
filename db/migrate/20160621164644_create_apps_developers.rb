class CreateAppsDevelopers < ActiveRecord::Migration
  def change
    create_table :apps_developers do |t|
		t.integer :app_id
		t.integer :developer_id
    end
  end
end
