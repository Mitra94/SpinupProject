class AddVersionToMicropost < ActiveRecord::Migration
  def change
  	add_column :microposts, :app_version, :string
  end
end
