class CreateRealizers < ActiveRecord::Migration
  def change
    create_table :realizers do |t|
      t.references :developer, index: true, foreign_key: true
      t.references :app, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
