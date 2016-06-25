class App < ActiveRecord::Base
	has_and_belongs_to_many :developers
	has_many :microposts, dependent: :destroy
end
