class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.string :skill
      t.integer :voted
      t.string :voter

      t.timestamps null: false
    end
  end
end
