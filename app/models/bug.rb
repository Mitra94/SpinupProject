class Bug < ActiveRecord::Base

	belongs_to :developer
	belongs_to :app

end
