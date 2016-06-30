class AddAppToReport < ActiveRecord::Migration
  def change
  		add_column :reports, :app_id, :integer
  end
end
