class CreateLoves < ActiveRecord::Migration
  def change
    create_table :loves do |t|
      t.integer :lover_id
      t.integer :loved_id

      t.timestamps null: false
    end
  end
end
