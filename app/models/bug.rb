class Bug < ActiveRecord::Base

	belongs_to :developer
	belongs_to :app

	validates :app_id, presence: :true, numericality: {greater_than: 0}
	validates :founder, presence: :true
	validates :description, presence: :true, length: {maximum: 256}

end
