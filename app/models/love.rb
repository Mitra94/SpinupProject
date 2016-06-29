class Love < ActiveRecord::Base
  belongs_to :lover, class_name: "User"
  belongs_to :loved, class_name: "Comment"
  
  validates :lover_id, presence: true
  validates :loved_id, presence: true
end
