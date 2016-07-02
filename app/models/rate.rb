class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true
  
  validates :rater_id, presence: true
  validates :rateable_id, presence: true

end
