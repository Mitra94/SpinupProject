class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :app
      t.string :sender
      t.string :receiver

      t.timestamps null: false
    end
  end
end
