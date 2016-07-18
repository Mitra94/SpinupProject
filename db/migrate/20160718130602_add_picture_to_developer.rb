class AddPictureToDeveloper < ActiveRecord::Migration
  def change
	add_column :developers, :picture, :string
  end
end
