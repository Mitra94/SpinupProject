class Notification < ActiveRecord::Base
  belongs_to :notifier, class_name: 'User'
  belongs_to :notified, class_name: 'User'
  belongs_to :opinion 
  
  validates :notifier_id, presence: true
  validates :notified_id, presence: true
  validates :opinion_id, presence: true 
  validates :kind, presence: true   
end
