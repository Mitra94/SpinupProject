class CreateSpins < ActiveRecord::Migration
  def change
    create_table :spins do |t|
      t.integer :spiner_id
      t.integer :spined_id

      t.timestamps null: false
    end
  end
end
