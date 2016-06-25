class AddDeveloperToApp < ActiveRecord::Migration
  def change
    add_reference :apps, :developer, index: true, foreign_key: true
  end
end
