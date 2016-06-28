class Invite < ActiveRecord::Base
	has_and_belongs_to_many :apps
	has_and_belongs_to_many :developers
end
