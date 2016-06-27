class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.references :developer, index: true, foreign_key: true
      t.references :app, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :microposts, [:developer_id, :app_id, :created_at]
  end
end
