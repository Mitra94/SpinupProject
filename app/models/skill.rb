class Skill < ActiveRecord::Base
	
	belongs_to :developer

	validates :html_css, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }, presence: true
	validates :java, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50}, presence: true
	validates :javascript, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50}, presence: true
	validates :c, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50}, presence: true
	validates :c_plus_plus, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50}, presence: true
	validates :nodejs, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50}, presence: true
	validates :database, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50}, presence: true
	validates :algorithms, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50}, presence: true
	validates :android, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50}, presence: true
	validates :ios, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 50}, presence: true

end
