class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :platform
      t.string :category
      t.references :developer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
