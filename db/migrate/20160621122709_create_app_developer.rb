class CreateAppDeveloper < ActiveRecord::Migration
  def change
    create_table :app_developers, id: false do |t|
		t.belongs_to :apps, index: true
		t.belongs_to :developers, index: true
    end
  end
end
