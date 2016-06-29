class Comment < ActiveRecord::Base
  belongs_to :developer
  belongs_to :micropost
  
  has_many :passive_loves,	class_name:  "Love",
                                   foreign_key: "loved_id",
                                   dependent:   :destroy

  has_many :lovers, through: :passive_loves, source: :lover
end
