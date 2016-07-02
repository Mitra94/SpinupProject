class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :Game
      t.string :Photo
      t.string :Family
      t.string :Music
      t.string :Shopping
      t.string :Social
      t.string :Communication

      t.timestamps null: false
    end
  end
end
