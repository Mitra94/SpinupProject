class Skill < ActiveRecord::Base
	
	belongs_to :developer

	validates :html_css, numericality: {greater_than_or_equal_to: 0}
	validates :java, numericality: {greater_than_or_equal_to: 0}
	validates :javascript, numericality: {greater_than_or_equal_to: 0}
	validates :c, numericality: {greater_than_or_equal_to: 0}
	validates :c_plus_plus, numericality: {greater_than_or_equal_to: 0}
	validates :nodejs, numericality: {greater_than_or_equal_to: 0}
	validates :database, numericality: {greater_than_or_equal_to: 0}
	validates :algorithms, numericality: {greater_than_or_equal_to: 0}
	validates :android, numericality: {greater_than_or_equal_to: 0}
	validates :ios, numericality: {greater_than_or_equal_to: 0}

end
