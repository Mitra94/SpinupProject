class AddRememberDigestToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :remember_digest, :string
  end
end
