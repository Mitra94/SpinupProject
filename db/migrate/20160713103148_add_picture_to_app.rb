class AddPictureToApp < ActiveRecord::Migration
  def change
    add_column :apps, :picture, :string
  end
end
