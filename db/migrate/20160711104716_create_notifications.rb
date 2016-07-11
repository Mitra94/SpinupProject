class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :notifier, index: true, foreign_key: true
      t.references :notified, index: true, foreign_key: true
      t.references :opinion, index: true, foreign_key: true
      t.string :kind
      t.boolean :read, default: false

      t.timestamps null: false
    end
      add_foreign_key :notifications, :notifier
      add_foreign_key :notifications, :notified
      add_foreign_key :notifications, :opinions
  end
end
