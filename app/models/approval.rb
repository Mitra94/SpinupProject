class Approval < ActiveRecord::Base

	has_and_belongs_to_many :developers

	validates :skill, presence: :true, inclusion: {in: %w(htmlcss java javascript c cplus nodejs database algorithms android ios)}
	validates :voted, presence: :true
	validates :voter, presence: :true

end
