class Report < ActiveRecord::Base

	belongs_to :opinion

	validates :user_id, presence: :true, numericality: {greater_than: 0}
	validates :comment, presence: :true
	validates :post_id, presence: :true, numericality: {greater_than: 0}
	validates :app_id, presence: :true, numericality: {greater_than: 0}

end
