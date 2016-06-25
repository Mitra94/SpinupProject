class AppDeveloper < ActiveRecord::Base
	belongs_to :app
	belongs_to :developer
end
