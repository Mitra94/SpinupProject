class AddVersionToApp < ActiveRecord::Migration
  def change
  	add_column :apps, :version, :string
  end
end
