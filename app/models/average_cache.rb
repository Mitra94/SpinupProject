class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :raterdev, :class_name => "Developer"
  belongs_to :rateable, :polymorphic => true
end
