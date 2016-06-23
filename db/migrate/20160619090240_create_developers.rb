class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :name
      t.string :email
      t.string :surname
      t.string :city
      t.integer :age

      t.timestamps null: false
    end
  end
end
