class CreateAppDevelopers < ActiveRecord::Migration
  def change
    create_table :app_developers do |t|
      t.integer :app_id
      t.integer :developer_id

      t.timestamps null: false
    end
  end
end
