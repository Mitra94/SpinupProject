class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :html_css
      t.integer :java
      t.integer :javascript
      t.integer :c
      t.integer :c_plus_plus
      t.integer :nodejs
      t.integer :database
      t.integer :algorithms
      t.integer :android
      t.integer :ios

      t.timestamps null: false
    end
  end
end
